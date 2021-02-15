-------------------------------------------------
-- corona recovered CH (upperblue)
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

temp_widget:set_bg("#000000")  -- black background
temp_widget:set_fg("#CD1717")  -- bright red


-- for corona deathrate --local noisy = [[bash -c '/home/jon/.local/bin/utilities/corona recoverrate']]
local catter = [[bash -c 'cat /tmp/ccountuk']]

--watch (noisy,3600)
watch (
catter,1200,
function(_, stdout, stderr, reason, exit_code)
temp_text:set_text(" " .. stdout)
end,
 temp_widget
 )

--awful.spawn.easy_async(catter, function(stdout, stderr, reason, exit_code)
--    temp_text:set_text(" " .. stdout)
--end)

temp_text:set_text(" ??? ")
return temp_widget


