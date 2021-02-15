-------------------------------------------------
-- Test widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")

-- Create the text widget
local temp_text = wibox.widget{
	    font = "Inconsolata 9",
	        widget = wibox.widget.textbox,
	}

	-- Create the background widget
	local temp_widget = wibox.widget.background()
	temp_widget:set_widget(temp_text) -- Put the text inside of it

	-- Set the colors and some text
	temp_widget:set_bg("#4d5eff")  -- Green background
	temp_widget:set_fg("#1d1d1d")  -- White text
	temp_text:set_text("this is temporary")

	-- Export the widget
	return temp_widget

