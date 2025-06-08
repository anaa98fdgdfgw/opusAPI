-- Elevator Screen application using Opus OS UI
-- Converts floor selection into network messages

local Config = require('opus.config')
local UI     = require('opus.ui')

peripheral.find('modem', rednet.open)

UI:configure('ElevatorScreen', ...)

local config = Config.load('ElevatorScreen', {
  floors = 0,
  id     = 0,
  page   = 1,
})

if config.floors <= 0 or config.id <= 0 then
  term.clear()
  term.setCursorPos(1,1)
  io.write('Total number of floors: ')
  config.floors = tonumber(read()) or 0
  io.write('ID of receiving computer: ')
  config.id = tonumber(read()) or 0
  Config.update('ElevatorScreen', config)
end

print('Press Ctrl-E to clear settings')

local device = UI.term
local width, height = device.width, device.height

local pocketMode = width <= 26 or height <= 20
local buttonsPerColumn
local columns
local buttonWidth

if pocketMode then
  buttonsPerColumn = math.floor((height - 2) / 2)
  columns = 1
  buttonWidth = width - 2
else
  buttonsPerColumn = math.floor(height / 2)
  columns = math.min(math.ceil(config.floors / buttonsPerColumn), 3)
  buttonWidth = width - 2
  if config.floors * 2 >= height then
    buttonWidth = math.floor((width - columns - 3) / columns)
  end
end

local maxPerPage = buttonsPerColumn * columns
local pages = math.ceil(config.floors / maxPerPage)

local pageList = {}
local topFloor = config.floors - 1
local floor = topFloor

for p = 1, pages do
  local pg = UI.Page{
    accelerators = {
      ['control-e'] = 'clear',
      ['control-q'] = 'quit',
    },
  }
  local x = 2
  local y = height - 1
  for i = 1, maxPerPage do
    if floor < 0 then break end
    local name = 'btn_' .. floor
    pg:add({[name] = UI.Button{
      x = x, ex = x + buttonWidth - 1, y = y,
      text = tostring(floor), event = 'floor',
      floor = floor,
      backgroundColor = colors.red,
      backgroundFocusColor = colors.lime,
    }})
    y = y - 2
    if y < 1 then
      x = x + buttonWidth + 2
      y = height - 1
      if x + buttonWidth - 1 > width then
        break
      end
    end
    floor = floor - 1
  end
  if p < pages then
    pg:add({ next = UI.Button{ x = width - 4, y = height, text = '>>', event = 'next' } })
  end
  if p > 1 then
    pg:add({ prev = UI.Button{ x = 2, y = height, text = '<<', event = 'prev' } })
  end
  if pages > 1 then
    pg:add({ pageLabel = UI.Text{ x = math.floor(width / 2) - 3, y = height, value = 'Page ' .. p } })
  end
  pageList[p] = pg
end

local currentPage = math.min(config.page, pages)

local function saveConfig()
  config.page = currentPage
  Config.update('ElevatorScreen', config)
end

local function sendFloor(n)
  rednet.send(config.id, n, 'call')
end

for i, pg in ipairs(pageList) do
  function pg:eventHandler(event)
    if event.type == 'clear' then
      fs.delete('usr/config/ElevatorScreen')
      UI:quit()
      return true
    elseif event.type == 'quit' then
      UI:quit()
      return true
    elseif event.type == 'button_press' then
      if event.button == self.next then
        currentPage = currentPage + 1
        UI:setPage(pageList[currentPage])
        saveConfig()
      elseif event.button == self.prev then
        currentPage = currentPage - 1
        UI:setPage(pageList[currentPage])
        saveConfig()
      else
        if event.button.floor then
          sendFloor(event.button.floor)
        end
      end
      return true
    end
    return UI.Page.eventHandler(self, event)
  end
end

UI:setPage(pageList[currentPage])
UI:start()
