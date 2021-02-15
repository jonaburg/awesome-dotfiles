-------------------------------------------------
-- Mem widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")  -- For periodic command execution
local lain  = require("lain")
local markup = lain.util.markup

-- Create the text widget
local freem_text = wibox.widget{
    font = "inconsolata 10",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local freem_widget = wibox.widget.background()
freem_widget:set_widget(freem_text)

-- Set the base colors (will be immediately replaced)
freem_widget:set_bg("#008800")  -- Green background
freem_widget:set_fg("#ffffff")  -- White text

watch(
  'bash -c "LANGUAGE=en_US.UTF-8 free | grep -z Mem.*Swap.*"', 1,
  function(_, stdout, stderr, exitreason, exitcode)
    local freem = nil
    -- This loop matches the groups number(s).number(s)
    -- each pair is converted to a number and saved on `freem`
    -- (Only the last group is kept)
    for str in string.gmatch(stdout, "([0-9]+.[0-9]+)") do
      freem = tonumber(str)
    end

    -- Set that as text (not just the raw command)
    freem_text:set_text(" " .. freem .. "%" )
--    freem_text:set_markup(markup("#000000", " " .. freem .. markup("#000000", cpu_now.usage .. "%" )))
end,
  freem_widget
)


function set_tag_color1()
freem_widget:set_bg("#BBF74C")  -- Green background
end
function set_tag_color2()
freem_widget:set_bg("#FEE715")  -- Orangeish background
end
function set_tag_color3()
freem_widget:set_bg("#15FEC6")  -- Cyan background
end
function set_tag_color4()
freem_widget:set_bg("#3970FF")  -- blue background
end
function set_tag_color5()
freem_widget:set_bg("#FF4A4A")  -- blue background
end



screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )
screen[1]:connect_signal("tag6", set_tag_color3 )





freem_text:set_text(" ??? ")

-- Export the widget
return mem_widget

