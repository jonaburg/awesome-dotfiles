-------------------------------------------------
-- corona CH (red)
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")

-- Create the text widget
local temp_text = wibox.widget{
    		font = "Inconsolata 9",
    		widget = wibox.widget.textbox,
	}

	local temp_widget = wibox.widget.background()
	temp_widget:set_widget(temp_text)


-- for corona deathrate
local noisy = [[bash -c '/home/jon/.local/bin/utilities/corona deathrrate; cat /tmp/ccount ']]

awful.spawn.easy_async(noisy, function(stdout, stderr, reason, exit_code)
    temp_text:set_text(stdout)
end)

temp_widget:set_bg("#CD6060")  -- RED background
    temp_widget:set_fg("#1d1d1d")  -- White text
return temp_widget


