-- Elevator Screen App using Opus UI
local UI   = require('opus.ui')

local fs       = _G.fs
local peripheral = _G.peripheral
local rednet   = _G.rednet
local term     = _G.term
local textutils = _G.textutils
local read     = _G.read

local INFO_FILE = 'info'

-- configure UI and choose display device
UI:configure('ElevatorScreen', ...)
peripheral.find('modem', rednet.open)

-- attempt to use a monitor if one is attached
local monitor = peripheral.find('monitor')
if monitor then
  monitor.setTextScale(0.5)
  UI:setDefaultDevice(UI.Device{ device = monitor })
end

local floor
local remoteId

-- load persisted configuration
if fs.exists(INFO_FILE) then
  local h = fs.open(INFO_FILE, 'r')
  local info = textutils.unserialize(h.readAll())
  h.close()
  if info then
    floor = tonumber(info[1])
    remoteId = tonumber(info[2])
  end
end

-- ask for data if missing
while not floor or not remoteId do
  term.write('Total number of floors: ')
  floor = tonumber(read())
  term.write('ID of receiving computer: ')
  remoteId = tonumber(read())
  local h = fs.open(INFO_FILE, 'w')
  h.write(textutils.serialize({ floor, remoteId }))
  h.close()
end

-- build floor list
local floors = { }
for i = floor - 1, 0, -1 do
  table.insert(floors, { name = tostring(i), value = i })
end

-- ui setup
local page = UI.Page {
  grid = UI.ScrollingGrid {
    y = 2,
    ey = -2,
    columns = {
      { heading = 'Floor', key = 'name' },
    },
    values = floors,
  },
  statusBar = UI.StatusBar { values = 'Select floor' },
  accelerators = {
    [ 'e' ] = 'clear',
    [ 'control-q' ] = 'quit',
  },
}

function page:eventHandler(event)
  if event.type == 'grid_select' then
    rednet.send(remoteId, event.selected.value, 'call')
    self.statusBar:timedStatus('Sent to floor ' .. event.selected.value, 2)
  elseif event.type == 'clear' then
    fs.delete(INFO_FILE)
    self.statusBar:timedStatus('Cleared data', 2)
  elseif event.type == 'quit' then
    UI:quit()
  else
    return UI.Page.eventHandler(self, event)
  end
  return true
end

UI:setPage(page)
UI:start()
