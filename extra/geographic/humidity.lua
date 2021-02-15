-------------------------------------------------
-- humidity monitor based on LQ
-------------------------------------------------
-- IMPORTANT! --
-- airquality module currently controls refreshing data. if not using, then enable it here.


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
    text = '  ', -- windows icon
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
--local humidity = wibox.container.background(mascarpone_widget, "#7289DA") -- deep purp
local humidity = wibox.container.background(mascarpone_widget, "#93c5c8") -- deep purp

--	        textbox_widget:set_text( " 📨 ")
--	        textbox_widget:set_markup(markup("#000000", " 📨 "))
--	        textbox_notify_widget:set_text( "  " ..  stdout .. "  " )
--            emailbg:set_bg("#D9574F")


--local refresh_data = [[bash -c "airquality"]]
local aqi_val = [[bash -c "cat /tmp/humidity"]]


-- ensuring the icon will have black fg text.
textbox_widget:set_markup(markup("#000000", " 🌊 "))

--watch(refresh_data, 3600)

-- automatically scans for VM status..
watch(
aqi_val, 3590,
function(widget, stdout, stderr, exitreason, exitcode)
  local val = tostring(stdout)
            textbox_notify_widget:set_text(val)
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


return humidity
