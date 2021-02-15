-------------------------------------------------
-- air quality monitor
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
--local airquality = wibox.container.background(mascarpone_widget, "#9FBD8D") -- muggy green
local airquality = wibox.container.background(mascarpone_widget, "#9593c8") -- muggy green

--	        textbox_widget:set_text( " 📨 ")
--	        textbox_widget:set_markup(markup("#000000", " 📨 "))
--	        textbox_notify_widget:set_text( "  " ..  stdout .. "  " )
--            emailbg:set_bg("#D9574F")


local refresh_data = [[bash -c "airquality"]]
local aqi_val = [[bash -c "cat /tmp/aqi"]]


-- ensuring the icon will have black fg text.
textbox_widget:set_markup(markup("#000000", "  "))

watch(refresh_data, 3600)

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


-- notification for britbongs
function show_brit()
    awful.spawn.easy_async([[bash -c 'cat /tmp/coronauk']],
        function(stdout, stderr, reason, exit_code)
            naughty.notify{
                text = stdout,
                title = "court writ yer honor",
                timeout = 30, hover_timeout = 5,
                width = 1250,
		font = "Iosevka 10",
		fg = ("#ff0000"),
		bg = ("#000000" .. "35"),
		position = 'top_middle',
		icon = overlay,
            }
        end
    )
end

return airquality
