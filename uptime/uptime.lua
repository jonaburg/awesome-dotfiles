-------------------------------------------------
-- uptime widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")  -- For periodic command execution
local lain  = require("lain")
local markup = lain.util.markup

-- Create the text widget
local uptime = wibox.widget{
    font = "inconsolata 9",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local uptime_widget = wibox.widget.background()
uptime_widget:set_widget(uptime_text)
-- Set the base colors (will be immediately replaced)
uptime_widget:set_bg("#008800")  -- Green background
uptime_widget:set_fg("#ffffff")  -- White text



watch(
  "uptime", 10,
  function(_, stdout, stderr, exitreason, exitcode)
    local uptime = nil

    -- This loop matches the groups number(s).number(s)
    -- each pair is converted to a number and saved on `uptime`
    -- (Only the last group is kept)
    for str in string.gmatch(stdout, "([0-9]+.[0-9]+)") do
      uptime = tonumber(str)
    end

    -- Set that as text (not just the raw command)
    uptime_text:set_text(" " .. uptime .. " 💹 ")
    -- add individual markup coloring for icons and numbers seperately
    uptime_text:set_markup(markup("#ff2222", " " .. uptime .. markup("#000000", " 💹 ")))
end,

  uptime_widget
)

--uptime_text:set_text(" ??? ")

-- Export the widget
return uptime_widget

