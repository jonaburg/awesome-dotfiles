-------------------------------------------------
-- starl portfolio addon
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
	fg = "#DDE295",
	widget = wibox.container.background,
}
local starlportfolio = wibox.widget {
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}

local price = [[bash -c "cat ~/.config/awesome/tmp/starl_portfolio"]]
-- call to update the function actually every 29 min 59 seconds.
watch(
update_starl, 599,
function() end
)

-- update indicator every 30 minutes
watch(
price, 600,
function(widget, stdout, stderr, exitreason, exitcode)
  local output = tostring(stdout)
            textbox_notify_widget:set_text("$" .. output)
    end
)

return starlportfolio