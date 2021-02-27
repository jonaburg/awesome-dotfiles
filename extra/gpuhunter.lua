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
	font = "Iosevka 12",
	widget = wibox.widget.textbox,
	}
local textbox_notify_widget = wibox.widget {
	 font = "Iosevka 12",
	 widget = wibox.widget.textbox,
	}
local textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
--bg = beautiful.my_color,
--	bg = "#c3c2c3", -- dark
  bg = "#A5A5A6", -- even darker
	fg = "#000000",
	widget = wibox.container.background,
}
local mascarpone_widget = wibox.widget {
--local gpuhunter = wibox.widget {
	textbox_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}
--local gpuhunter = wibox.container.background(mascarpone_widget, "#93C8b0") -- pale green
--local gpuhunter = wibox.container.background(mascarpone_widget, "#97c3c9") -- new windows blue
--local gpuhunter = wibox.container.background(mascarpone_widget, "#9FBD8D") -- nvidia green
--local gpuhunter = wibox.container.background(mascarpone_widget, "#668371") -- retro green
--local gpuhunter = wibox.container.background(mascarpone_widget, "#5f6e4e") -- retro pale blue
local gpuhunter = wibox.container.background(mascarpone_widget, "#677a52") -- retro green 2

local watchstatus = [[bash -c "nvidia-smi --format=csv --query-gpu=utilization.gpu | tail -1"]]

-- ensuring the icon will have black fg text.
textbox_widget:set_markup(markup("#000000", "  "))

-- automatically scans for VM status..
watch(
watchstatus, 5,
function(widget, stdout, stderr, exitreason, exitcode)
  local util = tostring(stdout)
            textbox_notify_widget:set_text(util)
    end
)

print(beautiful.my_color)

return gpuhunter
