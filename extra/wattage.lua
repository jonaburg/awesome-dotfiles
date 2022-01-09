-------------------------------------------------
-- battery wattage output (laptop)
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

local textbox_notify_widget = wibox.widget {
	 font = beautiful.font,
	 widget = wibox.widget.textbox,
	}
local textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
	fg = beautiful.yellow,
	widget = wibox.container.background,
}
local wattage = wibox.widget {
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}

--local watchstatus = [[bash -c " echo $(($(cat /sys/class/power_supply/BAT1/power_now) / 100000)) | awk  '{printf( \"%.\" C \"f\n\", $1 / 10^C) }' C=1 | sed  's/$/ W/g' " ]]

local charge_status =  [[ bash -c "cat /sys/class/power_supply/BAT0/status" ]]
--local watchstatus = [[bash -c " echo $(($(cat /sys/class/power_supply/BAT0/power_now) / 100000)) | awk  '{printf( \"%.\" C \"f\n\", $1 / 10^C) }' C=1 | sed  's/$/ W/g' " ]]
local watchstatus = [[bash -c " echo $(($(cat /sys/class/power_supply/BAT0/current_now) / 10000)) | awk  '{printf( \"%.\" C \"f\n\", $1 / 10^C) }' C=1 | sed  's/$/ W/g' " ]]

-- polls for wattage and displays it on widget..
watch(
watchstatus, 5,
function(widget, stdout, stderr, exitreason, exitcode)
  local output = tostring(stdout)
            textbox_notify_widget:set_text(output)
    end
)


return wattage
