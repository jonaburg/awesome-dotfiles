-------------------------------------------------
-- Brightness Bar Widget for Awesome Window Manager
-- Shows the current color temperature
-- to be used with brightmonshifter (utilities/shifter)

-- @author Jon Burga
-- @copyright 2020 Jon Burga
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")


local GET_BRIGHT_CMD = 'xbacklight'
local INC_BRIGHT_CMD = 'xbacklight -inc 10'
local DEC_BRIGHT_CMD = 'xbacklight -dec 10'

local widget = {}

local function worker(args)

    local args = args or {}

    local main_color = args.main_color
    local background_color = args.background_color or beautiful.bg_urgent
    local width = args.width or 20
    local height = args.height or 100
    local forced_height = args.forced_height or 1
    local shape = args.shape or 'bar'
    local margins = args.margins or 750

    local get_bright_cmd = args.get_bright_cmd or GET_BRIGHT_CMD
    local inc_bright_cmd = args.inc_bright_cmd or INC_BRIGHT_CMD
    local dec_bright_cmd = args.dec_bright_cmd or DEC_BRIGHT_CMD

    local brightbar_widget = wibox.widget {
        max_value = 1,
        forced_width = 100, -- this is 1 for vertical.
	forced_height = 25,
	ticks = false,
	tick_size=50,
--	ticks_gap= 20,
--        color = main_color,
        color = fgcolor,
--        background_color = '#ffffff11',
        background_color = bgcolor,
        shape = gears.shape[shape],
        margins = {
            top = margins,
            bottom = margins,
        },
        widget = wibox.widget.progressbar
    }

    local update_graphic = function(widget, stdout, _, _, _)
        local shift = string.match(stdout, '%d+')   -- (\d?\d?\d)\%)
        currentval = tonumber(shift)
        widget.value = currentval/100;
        widget.color = main_color
	widget.background_color = background_color

    end

-- gradient
local fgcolor  = gears.color({
  type = "radial",
  from = { 53, 50, 50 },
  to = { 50, 50, 50 },
--  stops = { { 40, "#ff0000" }, { 85, "#00ff00" }, { 73, "#0000ff" } }
  stops = { { 40, "#68a9df" }, { 35, "#68a9df" }, { 73, "#68a9df" } }
})

-- ANOTHER gradient
local bgcolor  = gears.color({
  type = "radial",
  from = { 5, 70, 40 },
  to = { 90, 90, 30 },
  stops = { { 70, "#ff0000" }, { 35, "#00ff00" }, { 1000, "#0000ff" } }
})


--    local update_graphic = function(widget, stdout, _, _, _)
--        local shift = string.match(stdout, "(%d?%d?%d)%%")  -- (\d?\d?\d)\%)
--        shift = tonumber(string.format("% 3d", volume))
--
--        widget.value = shift / 100;
--
--    end

    brightbar_widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 4) then
            awful.spawn(inc_bright_cmd)
        elseif (button == 5) then
            awful.spawn(dec_bright_cmd)
        elseif (button == 1) then
        end

        spawn.easy_async(get_bright_cmd, function(stdout, stderr, exitreason, exitcode)
            update_graphic(brightbar_widget, stdout, stderr, exitreason, exitcode)
        end)
    end)

    watch(get_bright_cmd, 1, update_graphic, brightbar_widget)
    watch(update_graphic, 2)

    return brightbar_widget
end

return setmetatable(widget, { __call = function(_, ...) return worker(...) end })

