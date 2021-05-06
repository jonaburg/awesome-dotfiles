-------------------------------------------------
-- nvidia gpu monitor
-------------------------------------------------
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local lain = require("lain")
local markup = lain.util.markup
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}

local textbox_widget = wibox.widget {
    text = '  ',  -- fill with whatever icon
	font = "Iosevka 13",
	widget = wibox.widget.textbox,
	}
local textbox_notify_widget = wibox.widget {
	 font = "Iosevka 13",
	 widget = wibox.widget.textbox,
	}
local textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
	fg = "#88a67d",
	widget = wibox.container.background,
}
local gpuhunter = wibox.widget {
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}

local watchstatus = [[bash -c "nvidia-smi --format=csv --query-gpu=utilization.gpu | tail -1"]]

-- ensuring the icon will have black fg text.
--textbox_widget:set_markup(markup("#000000", "  "))

-- automatically scans for gpu usage percentage..
watch(
watchstatus, 5,
function(widget, stdout, stderr, exitreason, exitcode)
  local util = tostring(stdout)
            textbox_notify_widget:set_text("  " .. util)
    end
)

return gpuhunter
