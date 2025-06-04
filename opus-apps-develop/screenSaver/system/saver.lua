local Config = require('opus.config')
local UI     = require('opus.ui')

local config = Config.load('saver', {
	enabled = true,
    timeout = 60,
})

return UI.Tab {
	title = 'Screen Saver',
	description = 'Screen saver',
	[1] = UI.Window {
		x = 2, y = 2, ex = -2, ey = 5,
	},
	label1 = UI.Text {
		x = 3, y = 3,
		value = 'Enabled',
	},
	checkbox = UI.Checkbox {
		x = 21, y = 3,
		value = config.enabled
	},
	label2 = UI.Text {
		x = 3, y = 4,
		value = 'Timeout',
	},
	timeout = UI.TextEntry {
		x = 21, y = 4, width = 6,
		limit = 4,
		transform = 'number',
		value = config.timeout,
		accelerators = {
			enter = 'update',
		},
	},
	button = UI.Button {
		x = -8, ex = -2, y = -2,
		text = 'Apply',
		event = 'update',
	},
	eventHandler = function(self, event)
		if event.type =='checkbox_change' then
			config.enabled = not not event.checked

		elseif event.type == 'update' then
			if self.timeout.value then
				config.timeout = self.timeout.value
				Config.update('saver', config)

				self:emit({ type = 'success_message', message = 'Settings updated' })
				os.queueEvent('config_update', 'saver', config)
			else
				self:emit({ type = 'error_message', message = 'Invalid timeout' })
			end
		end
		return UI.Tab.eventHandler(self, event)
	end,
}
