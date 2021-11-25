-------------------------------------------------
-- cpu temps intel based
-------------------------------------------------
local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local lain = require("lain")
local markup = lain.util.markup
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}

local textbox_widget = wibox.widget {
    text = ' ', -- bat i
	font = "Iosevka 23",
	widget = wibox.widget.textbox,
	}
local textbox_notify_widget = wibox.widget {
 --    text = '  ', --fa super
	 font = "Iosevka 23",
	 widget = wibox.widget.textbox,
	}
local textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
--	bg = "#c3c2c3", -- dark
	--bg = "#A5A5A6", -- even darker
	fg = "#a67d88",
	widget = wibox.container.background,
}
local verbosebat = wibox.widget {
--	textbox_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}

--local gputempshunter = wibox.container.background(mascarpone_widget, "#a67d88") -- brown

local watchstatus = [[bash -c "acpi | awk {'print $4, $5'} | tail -n 1"]]
--local watchstatus = [[bash -c " echo $(($(cat /sys/class/power_supply/BAT0/power_now) / 100000)) | sed -e 's/\b[0-9]/&./g' " ]]

-- ensuring the icon will have black fg text.
--textbox_widget:set_markup(markup("#000000", " ♨ "))

-- automatically scans for VM status..
watch(
watchstatus, 20,
function(widget, stdout, stderr, exitreason, exitcode)
  local util = tostring(stdout)
            textbox_notify_widget:set_text(" " .. util)
    end
)


return verbosebat
