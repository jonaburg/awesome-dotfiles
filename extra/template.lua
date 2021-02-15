-------------------------------------------------
-- Nvidia GPU perf widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")  -- For periodic command execution
local lain  = require("lain")
local markup = lain.util.markup

-- Create the text widget
local gpuhunter_text = wibox.widget{
    font = "inconsolata 10",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local gpuhunter_widget = wibox.widget.background()
gpuhunter_widget:set_widget(gpuhunter_text)

-- Set the base colors (will be immediately replaced)
gpuhunter_widget:set_bg("#008800")  -- Green background
gpuhunter_widget:set_fg("#ffffff")  -- White text



gpuhunter_text:set_text(" ??? ")

-- Export the widget
return gpuhunter_widget

