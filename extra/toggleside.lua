-------------------------------------------------
-- toggleSide
-------------------------------------------------
local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}


-- define the widget here.
side_toggle = wibox.widget {
    checked            = false,
    color              = beautiful.bg_normal,
    bg = gears.color.create_png_pattern(beautiful.psoman),
    border_width       = 3,
    paddings           = 4,
    border_color       = '#0000ff',
    --check_color        = '#ff0000',
    check_color = beautiful.psoman,
    check_border_color = '#ffff00',
    check_border_width = 1,
    buttons = {awful.button({}, 1, function() awesome.emit_signal("widget::panel::toggle") end)}, -- toggles the click to open the panel.
    widget             = wibox.widget.checkbox,
}


-- signal to animate check.
awesome.connect_signal("widget::panel::toggle", function ()
	if not side_toggle.checked then
      side_toggle.checked =  true
        else
      side_toggle.checked =  false
	end
end)




return side_toggle
