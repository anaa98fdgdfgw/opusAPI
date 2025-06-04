local Config = require('opus.config')
local UI     = require('opus.ui')
local Util   = require('opus.util')

local colors = _G.colors
local fs     = _G.fs

local context = ({ ... })[1]

local STARTUP_FILE = 'usr/autorun/'..context.configPath..'.lua'

local setup = UI.SlideOut {
	titleBar = UI.TitleBar {
		title = 'Remote Setup',
	},
	form = UI.Form {
		y = 2, ey = -1,
		[1] = UI.TextEntry {
			formLabel = 'Server', formKey = 'server',
			help = 'ID for the server',
			shadowText = 'Milo server ID',
			limit = 6,
			transform = 'number',
			required = true,
		},
		[2] = UI.TextEntry {
			formLabel = 'Return Slot', formKey = 'slot',
			help = 'Use a slot for sending to storage',
			shadowText = 'Inventory slot #',
			limit = 5,
			transform = 'number',
			required = false,
		},
		[3] = UI.Checkbox {
			formLabel = 'Shield Slot', formKey = 'useShield',
			help = 'Or, use the shield slot for sending'
		},
		[4] = UI.Checkbox {
			formLabel = 'Run on startup', formKey = 'runOnStartup',
			help = 'Run this program on startup'
		},
	},
	info = UI.TextArea {
		x = 2, ex = -2, y = 8, ey = -4,
		textColor = colors.yellow,
		marginLeft = 0,
		marginRight = 0,
		value = [[The Milo turtle must connect to a manipulator with a ]] ..
						[[bound introspection module. The neural interface must ]] ..
						[[also have an introspection module.]],
	},
	statusBar = UI.StatusBar {
		backgroundColor = 'primary',
	},
}

function setup:eventHandler(event)
	if event.type == 'focus_change' then
		self.statusBar:setStatus(event.focused.help)

	elseif event.type == 'form_complete' then
		Config.update(context.configPath, context.state)
		self:hide()
		context.page:refresh('list')
		context.page.grid:draw()
		context.page:setFocus(context.page.statusBar.filter)

		if context.state.runOnStartup then
			if not fs.exists(STARTUP_FILE) then
				Util.writeFile(STARTUP_FILE,
					[[os.sleep(1)
if shell.openForegroundTab then
	shell.openForegroundTab('packages/milo/MiloRemote')
end]])
			end
		elseif fs.exists(STARTUP_FILE) then
			fs.delete(STARTUP_FILE)
		end

	elseif event.type == 'form_cancel' then
		self:hide()
		context.page:setFocus(context.page.statusBar.filter)
	end

	return UI.SlideOut.eventHandler(self, event)
end

context.page:add({ setup = setup })
