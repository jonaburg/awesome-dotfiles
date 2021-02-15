-------------------------------------------------
-- Test widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local awful = require("awful")
local watch = require("awful.widget.watch")

-- Create the text widget
local temp_text = wibox.widget{
	    font = "Inconsolata 12",
	    widget = wibox.widget.textbox,
	}

	-- Create the background widget
local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_text) -- Put the text inside of it




	-- Set the colors and some text
--temp_widget:set_bg("#4d5eff")  -- Green background
--temp_widget:set_fg("#1d1d1d")  -- White text

temp_widget:set_bg("#000000")  -- Green background
temp_widget:set_fg("#6A4BFF")  -- blue text

local catter = [[bash -c 'cat /tmp/ccountf']]

--watch (noisy,3600)
watch (
catter,1200,
function(_, stdout, stderr, reason, exit_code)
temp_text:set_text(" " .. stdout)
end,
 temp_widget
 )

temp_text:set_text(" ??? ")
	-- Export the widget
	return temp_widget

