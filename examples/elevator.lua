-- Opus OS elevator app - supports VNC pocket displays
require('opus.injector')(_ENV)

local Config     = require('opus.config')
local Peripheral = require('opus.peripheral')
local UI         = require('opus.ui')

local term       = _G.term
local multishell = _ENV.multishell

multishell.setTitle(multishell.getCurrent(), 'Elevator')

-- load configuration or prompt
local cfg = Config.load('elevator', { floors = false, id = false, page = 1 })
if not cfg.floors or not cfg.id then
  term.clear()
  term.setCursorPos(1,1)
  write('Total number of floors: ')
  cfg.floors = tonumber(read())
  write('ID of receiving computer: ')
  cfg.id = tonumber(read())
  Config.update('elevator', cfg)
end

peripheral.find('modem', rednet.open)

local monitor = Peripheral.get({ type = 'monitor' })
local vnc     = Peripheral.get({ type = 'vnc' })
local pocket  = _G.pocket or vnc

monitor = monitor or vnc or term.current()

local device = UI.Device {
  device = monitor,
  textScale = pocket and .5 or 1,
}
UI:setDefaultDevice(device)
UI:configure('elevator')

local mw, mh = device.width, device.height
local buttonsPerColumn = math.floor(mh/2)
local columns = math.min(math.ceil(cfg.floors/buttonsPerColumn), 3)
local maxButtons = buttonsPerColumn * 3
local pages = math.ceil(cfg.floors/maxButtons)
local buttonWidth = mw - 2
if cfg.floors * 2 >= mh then
  buttonWidth = math.floor((mw-columns-3)/columns)
end
if cfg.page > pages then
  cfg.page = pages
end

local pageList = {}
local pageIndex = 1
pageList[pageIndex] = UI.Page { backgroundColor = 'black' }

local minX = 2
local maxX = mw - 1
local minY = 1
local maxY = minY
local topFloor = cfg.floors - 1

if topFloor < buttonsPerColumn then
  for i = topFloor, 0, -1 do
    pageList[pageIndex]:add{ [tostring(i)] = UI.Button {
      x = minX, y = minY, width = buttonWidth,
      text = tostring(i), backgroundColor = 'red', textColor = 'lime',
      event = 'choose_floor', floor = i
    }}
    minY = minY + 2
    maxY = minY
  end
else
  minX = 2
  maxX = minX + buttonWidth
  minY = mh - 1
  maxY = minY
  for i = 0, topFloor do
    pageList[pageIndex]:add{ [tostring(i)] = UI.Button {
      x = minX, y = minY, width = buttonWidth,
      text = tostring(i), backgroundColor = 'red', textColor = 'lime',
      event = 'choose_floor', floor = i
    }}
    local remaining = topFloor - i
    minY = maxY - 2
    maxY = minY
    if maxY <= 0 then
      minX = maxX + 2
      maxX = minX + buttonWidth
      minY = mh - 1
      maxY = minY
      if maxX > mw then
        pageIndex = pageIndex + 1
        pageList[pageIndex] = UI.Page { backgroundColor = 'black' }
        minX = 2
        maxX = minX + buttonWidth
        minY = mh - 1
        maxY = minY
      end
      if remaining < buttonsPerColumn then
        minY = mh - 1 - ((buttonsPerColumn - remaining) * 2)
        maxY = minY
      end
    end
  end
end

pages = pageIndex
for p = 1, pages do
  local page = pageList[p]
  if p > 1 then
    page:add{ back = UI.Button{ x = 1, y = mh, width = 4, text = '<<', event = 'prev_page' } }
  end
  if p < pages then
    page:add{ next = UI.Button{ x = mw-3, y = mh, width = 4, text = '>>', event = 'next_page' } }
  end
  if pages > 1 then
    local label = mw == 15 and ('P.' .. p) or ('Page ' .. p)
    page:add{ lbl = UI.Text{ x = 5, y = mh, value = label } }
  end

  function page:eventHandler(event)
    if event.type == 'choose_floor' then
      rednet.send(cfg.id, event.button.floor, 'call')
      return true
    elseif event.type == 'next_page' then
      cfg.page = math.min(pages, cfg.page + 1)
      Config.update('elevator', cfg)
      UI:setPage(pageList[cfg.page])
      return true
    elseif event.type == 'prev_page' then
      cfg.page = math.max(1, cfg.page - 1)
      Config.update('elevator', cfg)
      UI:setPage(pageList[cfg.page])
      return true
    end
    return UI.Page.eventHandler(self, event)
  end

  table.insert(pageList, page)
end

UI:setPages(pageList)
UI:setPage(pageList[cfg.page])
UI:start()
