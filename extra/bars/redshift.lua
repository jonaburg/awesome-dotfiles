-------------------------------------------------
-- Redshift Bar Widget for Awesome Window Manager
-- Shows the current color temperature
-- to be used with shifter (utilities/shifter)

-- @Jon Burga 2020
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")


local GET_WARMTH_CMD = '/home/jon/.local/bin/utilities/shifter value'
local INC_WARMTH_CMD = '/home/jon/.local/bin/utilities/shifter warmer'
local DEC_WARMTH_CMD = '/home/jon/.local/bin/utilities/shifter colder'

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

    local get_warmth_cmd = args.get_warmth_cmd or GET_WARMTH_CMD
    local inc_warmth_cmd = args.inc_warmth_cmd or INC_WARMTH_CMD
    local dec_warmth_cmd = args.dec_warmth_cmd or DEC_WARMTH_CMD

    local redshiftbar_widget = wibox.widget {
        max_value = 1,
        forced_width = 100, -- this is 1 for vertical
	forced_height = 15,
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
        widget.value = currentval/6750;
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

    redshiftbar_widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 4) then -- scroll down
            awful.spawn(dec_warmth_cmd)
        elseif (button == 5) then -- scroll up
            awful.spawn(inc_warmth_cmd)
        elseif (button == 1) then
        end

        spawn.easy_async(get_warmth_cmd, function(stdout, stderr, exitreason, exitcode)
            update_graphic(redshiftbar_widget, stdout, stderr, exitreason, exitcode)
        end)
    end)

    watch(get_warmth_cmd, 1, update_graphic, redshiftbar_widget)
    watch(update_graphic, 1)

    return redshiftbar_widget
end

return setmetatable(widget, { __call = function(_, ...) return worker(...) end })

