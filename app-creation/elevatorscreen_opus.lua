-- Elevator Screen App rebuilt for Opus UI
local Config    = require('opus.config')
local Peripheral= require('opus.peripheral')
local UI        = require('opus.ui')

local fs       = _G.fs
local peripheral = _G.peripheral
local rednet   = _G.rednet
local os       = _G.os

UI:configure('ElevatorScreen', ...)
peripheral.find('modem', rednet.open)

-- use monitor when available
local monitor = Peripheral.get({ type = 'monitor' })
if monitor then
  monitor.setTextScale(0.5)
  UI:setDefaultDevice(UI.Device { device = monitor })
end

local config = Config.load('elevatorscreen', { floors = 0, remoteId = 0 })

local function buildFloors()
  local t = {}
  if tonumber(config.floors) then
    for i = config.floors - 1, 0, -1 do
      table.insert(t, { name = tostring(i), value = i })
    end
  end
  return t
end

local mainPage
local setupDialog

setupDialog = UI.Dialog {
  title = 'Setup',
  height = 7,
  form = UI.Form {
    y = 3, x = 2, ey = -2,
    event = 'save_setup',
    cancelEvent = 'dialog_cancel',
    floors = UI.TextEntry { formLabel = 'Floors',  formKey = 'floors',  width = 6, limit = 3, required = true, transform = 'number' },
    remoteId = UI.TextEntry { formLabel = 'Remote', formKey = 'remoteId', width = 6, limit = 6, required = true, transform = 'number' },
  },
  statusBar = UI.StatusBar(),
}

function setupDialog:eventHandler(event)
  if event.type == 'save_setup' then
    if not self.form:save() then
      return true
    end
    config.floors = tonumber(self.form.values.floors)
    config.remoteId = tonumber(self.form.values.remoteId)
    Config.update('elevatorscreen', config)
    mainPage.grid:setValues(buildFloors())
    self:hide()
    mainPage.statusBar:setStatus('Configuration saved')
  else
    return UI.Dialog.eventHandler(self, event)
  end
  return true
end

mainPage = UI.Page {
  menuBar = UI.MenuBar {
    buttons = {
      { text = 'Setup', event = 'setup' },
      { text = 'Clear', event = 'clear' },
    },
  },
  grid = UI.ScrollingGrid {
    y = 2, ey = -2,
    columns = { { heading = 'Floor', key = 'name' } },
    values = buildFloors(),
  },
  statusBar = UI.StatusBar { values = 'Select a floor' },
  accelerators = {
    s = 'setup',
    e = 'clear',
    ['control-q'] = 'quit',
  },
}

-- attach the configuration dialog to the page
mainPage:add({ setupDialog = setupDialog })

function mainPage:enable()
  UI.Page.enable(self)
  if not tonumber(config.floors) or not tonumber(config.remoteId) then
    setupDialog.form:setValues(config)
    setupDialog:show()
  end
end

function mainPage:eventHandler(event)
  if event.type == 'grid_select' then
    rednet.send(config.remoteId, event.selected.value, 'call')
    self.statusBar:timedStatus('Sent to floor ' .. event.selected.value, 2)
  elseif event.type == 'setup' then
    setupDialog.form:setValues(config)
    setupDialog:show()
  elseif event.type == 'clear' then
    config = { floors = 0, remoteId = 0 }
    Config.update('elevatorscreen', { })
    self.grid:setValues({})
    setupDialog.form:setValues(config)
    setupDialog:show()
  elseif event.type == 'quit' then
    UI:quit()
  else
    return UI.Page.eventHandler(self, event)
  end
  return true
end

UI:setPages({ mainPage })
UI:setPage(mainPage)
UI:start()
