-------------------------------------------------
-- Temperature widget
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
	temp_widget:set_bg("#008800")  -- Green background
	temp_widget:set_fg("#ffffff")  -- White text
	temp_text:set_text(" This is a simple widget ")

	-- Export the widget
	return temp_widget

