-------------------------------------------------
-- corona CH (red)
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")

-- Create the text widget
local temp_text = wibox.widget{
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}

	local temp_widget = wibox.widget.background()
	temp_widget:set_widget(temp_text)

-- controls all widgets
local noisy = [[bash -c '/home/jon/.local/bin/utilities/corona refresh']]
local catter = [[bash -c 'cat /tmp/ccount']]

watch (
catter,1200,
function(_, stdout, stderr, reason, exit_code)
    temp_text:set_text(" " .. stdout)
end,
temp_widget
)

watch (noisy,3600)

--temp_widget:set_bg("#CD6060")  -- RED background
--temp_widget:set_fg("#1d1d1d")  -- White text

temp_widget:set_bg("#000000")  -- Black background
temp_widget:set_fg("#E4EC4B")  -- Neon Yellow text

temp_text:set_text(" ??? ")
return temp_widget


