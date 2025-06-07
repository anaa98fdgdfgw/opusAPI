-- Example elevator screen app using opus UI library
require('opus.injector')(_ENV)

local Config = require('opus.config')
local Peripheral = require('opus.peripheral')
local UI = require('opus.ui')

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

local monitor = Peripheral.get({ type = 'monitor' }) or error('No monitor attached')
monitor.setTextScale(1)

UI:setDefaultDevice(UI.Device { device = monitor })
UI:configure('elevator')

local mw, mh = monitor.getSize()
local buttonsPerColumn = math.floor(mh/2)
local columns = math.min(math.ceil(cfg.floors/buttonsPerColumn), 3)
local maxPerPage = buttonsPerColumn * columns
local pages = math.ceil(cfg.floors/maxPerPage)
local buttonWidth = mw - 2
if cfg.floors * 2 >= mh then
  buttonWidth = math.floor((mw-columns-3)/columns)
end
if cfg.page > pages then
  cfg.page = pages
end

local pageList = {}
local floor = cfg.floors - 1
for p=1,pages do
  local page = UI.Page { backgroundColor = 'black' }
  local x = 2
  local y = 1
  local maxY = mh-1
  for c=1,columns do
    y = 1
    while y <= maxY and floor >= 0 do
      page:add{ [tostring(floor)] = UI.Button {
        x = x, y = y, width = buttonWidth,
        text = tostring(floor), backgroundColor = 'red', textColor = 'lime',
        event = 'choose_floor', floor = floor
      }}
      y = y + 2
      floor = floor - 1
    end
    x = x + buttonWidth + 2
  end
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
