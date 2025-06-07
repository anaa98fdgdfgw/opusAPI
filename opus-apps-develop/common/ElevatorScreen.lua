-- Elevator Screen application using Opus OS UI
-- Converts floor selection into network messages

local Config = require('opus.config')
local Socket = require('opus.socket')
local UI     = require('opus.ui')
local Util   = require('opus.util')

UI:configure('ElevatorScreen', ...)

local config = Config.load('ElevatorScreen', {
  floors = 0,
  id     = 0,
  port   = 188,
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

local device = UI.term
local width, height = device.width, device.height

local buttonsPerColumn = math.floor(height / 2)
local columns = math.min(math.ceil(config.floors / buttonsPerColumn), 3)
local maxPerPage = buttonsPerColumn * columns
local pages = math.ceil(config.floors / maxPerPage)
local buttonWidth = width - 2
if config.floors * 2 >= height then
  buttonWidth = math.floor((width - columns - 3) / columns)
end

local pageList = {}
local topFloor = config.floors - 1
local floor = topFloor

for p = 1, pages do
  local pg = UI.Page{}
  pg.buttons = {}
  local x = 2
  local y = height - 1
  for i = 1, maxPerPage do
    if floor < 0 then break end
    local name = 'btn_' .. floor
    pg.buttons[name] = floor
    pg:add({[name] = UI.Button{
      x = x, ex = x + buttonWidth - 1, y = y,
      text = tostring(floor), event = 'floor',
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
  pageList[p] = pg
end

local currentPage = math.min(config.page, pages)

local function saveConfig()
  config.page = currentPage
  Config.update('ElevatorScreen', config)
end

local function sendFloor(n)
  local socket, msg = Socket.connect(config.id, config.port)
  if socket then
    socket:write(n)
    socket:close()
  else
    _G._syslog(msg or 'connection failed')
  end
end

for i, pg in ipairs(pageList) do
  function pg:eventHandler(event)
    if event.type == 'button_press' then
      if event.button == self.next then
        currentPage = currentPage + 1
        UI:setPage(pageList[currentPage])
        saveConfig()
      elseif event.button == self.prev then
        currentPage = currentPage - 1
        UI:setPage(pageList[currentPage])
        saveConfig()
      else
        local f = self.buttons[event.button.name]
        if f then
          sendFloor(f)
        end
      end
      return true
    end
    return UI.Page.eventHandler(self, event)
  end
end

UI:setPage(pageList[currentPage])
UI:start()
