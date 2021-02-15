local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")


local path_to_icons = "/usr/share/icons/Moka/22x22/apps/"

temp_icon = wibox.widget.imagebox()
temp_icon:set_image(path_to_icons .. "/0ad.png")

-- Create the text widget
local temp_text = wibox.widget{
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
		}

	local temp_widget = wibox.widget.background()
--	temp_widget:set_widget(temp_icon)
	temp_widget:set_widget(temp_text)

-- controls all widgets
--local noisy = [[bash -c '/home/jon/.local/bin/utilities/corona refresh']]

watch (
'python /home/jon/.config/awesome/RateWidget/rates.py',3601,
function(widget, stdout, stderr, reason, exit_code)
	local eurtochf = tonumber(stdout) or 0
    temp_text:set_text(" " .. stdout .. "EUR/CHF")
end
)



temp_widget:set_bg("#000000")  -- Black background
temp_widget:set_fg("#E4EC4B")  -- Neon Yellow text

temp_text:set_text(" ??? ")
temp_icon:set_image(path_to_icons .. "/0ad.png")

return temp_widget




