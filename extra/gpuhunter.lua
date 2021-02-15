-------------------------------------------------
-- nvidia gpu monitor
-------------------------------------------------
local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local lain = require("lain")
local markup = lain.util.markup
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}

local textbox_widget = wibox.widget {
    text = '  ', -- windows icon
	font = "Iosevka 12",
	widget = wibox.widget.textbox,
	}
local textbox_notify_widget = wibox.widget {
 --    text = '  ', --fa super
	 font = "Iosevka 12",
	 widget = wibox.widget.textbox,
	}
local textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
--	bg = "#c3c2c3", -- dark
	bg = "#A5A5A6", -- even darker
	fg = "#000000",
	widget = wibox.container.background,
}
local mascarpone_widget = wibox.widget {
	textbox_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}
--local gpuhunter = wibox.container.background(mascarpone_widget, "#93C8b0") -- pale green
local gpuhunter = wibox.container.background(mascarpone_widget, "#9FBD8D") -- nvidia green
--local gpuhunter = wibox.container.background(mascarpone_widget, "#97c3c9") -- new windows blue

--	        textbox_widget:set_text( " 📨 ")
--	        textbox_widget:set_markup(markup("#000000", " 📨 "))
--	        textbox_notify_widget:set_text( "  " ..  stdout .. "  " )
--            emailbg:set_bg("#D9574F")


local watchstatus = [[bash -c "nvidia-smi --format=csv --query-gpu=utilization.gpu | tail -1"]]

-- ensuring the icon will have black fg text.
textbox_widget:set_markup(markup("#000000", "  "))

-- automatically scans for VM status..
watch(
watchstatus, 5,
function(widget, stdout, stderr, exitreason, exitcode)
  local util = tostring(stdout)
            textbox_notify_widget:set_text(util)
      --  if string.find(vm_status, "paused") then
      --      textbox_notify_widget:set_text(' __ ')
      --  end
      --  if string.find(vm_status, "running") then
      --      textbox_notify_widget:set_text(' + ')
      --  end
      --  if string.find(vm_status, "shut") then
      --      textbox_notify_widget:set_text('__ ')
      --  else
      --      textbox_notify_widget:set_text(vm_status)
      --  end
    end
)


return gpuhunter
