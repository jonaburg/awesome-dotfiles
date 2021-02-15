-------------------------------------------------
-- Uptime widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")  -- For periodic command execution
local lain  = require("lain")
local markup = lain.util.markup

-- Create the text widget
local temp_text = wibox.widget{
    font = "inconsolata 10",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_text)

-- Set the base colors (will be immediately replaced)
temp_widget:set_bg("#008800")  -- Green background
temp_widget:set_fg("#ffffff")  -- White text

watch(
  "uptime", 1,
  function(_, stdout, stderr, exitreason, exitcode)
    local temp = nil

    -- This loop matches the groups number(s).number(s)
    -- each pair is converted to a number and saved on `temp`
    -- (Only the last group is kept)
    for str in string.gmatch(stdout, "([0-9]+.[0-9]+)") do
      temp = tonumber(str)
    end

    -- Set that as text (not just the raw command)
    temp_text:set_text(" " .. temp .. " 💹  " .. cpu_now.usage .. "%" )
--    temp_text:set_markup(markup("#ff2222", " " .. temp .. markup("#000000", " 💹 ")))
    temp_text:set_markup(markup("#000000", " " .. temp .. markup("#000000", " 💹  " .. cpu_now.usage .. "%" )))
end,
  temp_widget
)


function set_tag_color1()
temp_widget:set_bg("#BBF74C")  -- Green background
end
function set_tag_color2()
--temp_widget:set_bg("#FEE715")  -- yellow background
temp_widget:set_bg("#FF8800")  -- Orangeish background
end
function set_tag_color3()
temp_widget:set_bg("#15FEC6")  -- Cyan background
end
function set_tag_color4()
temp_widget:set_bg("#3970FF")  -- blue background
end
function set_tag_color5()
temp_widget:set_bg("#FF4A4A")  -- blue background
end



screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )
screen[1]:connect_signal("tag6", set_tag_color3 )





temp_text:set_text(" ??? ")

-- Export the widget
return temp_widget

