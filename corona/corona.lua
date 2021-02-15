-------------------------------------------------
-- corona tracking widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")

-- Create the text widget
local corona_text = wibox.widget{
	    font = "Inconsolata 9",
	    widget = wibox.widget.textbox,
	}

--	-- Create the background widget
	local corona_widget = wibox.widget.background()
	corona_widget:set_widget(corona_text) -- Put the text inside of it
--
	-- Set the colors and some text
--	corona_widget:set_bg("#4d5eff")  -- Green background
	corona_widget:set_bg("#CD6060")  -- Green background
	corona_widget:set_fg("#1d1d1d")  -- White text
--	corona_text:set_text("this is coronaorary")


watch( 'bash -c "cat /tmp/ccount"', 3600),
  function(_, stdout, stderr, exitreason, exitcode)
    local corona = nil

    -- Set that as text (not just the raw command)
    corona_text:set_text(" " .. corona )
--    corona_text:set_markup(markup("#ff2222", " " .. corona ))
end,

	-- Export the widget
	return corona_widget

