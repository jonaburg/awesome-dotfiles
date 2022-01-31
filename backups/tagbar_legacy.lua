-- tagbar (bottom) "panel"
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources") local dpi = xresources.apply_dpi
local tagbar = require('extra.slidebars.tagbar')
local ddcshift = require('extra.bars.ddcshift')
local redshift = require('extra.bars.redshift')
local side_toggle = require('extra.toggleside')
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


------------------------------------ [[Setting up ddcshift and redshift ]]---------------------------
--local cornershifter = gears.color({
--	type = "linear",
--	from = { dpi(12), 0},
--	to   = { dpi(182), 20},
--	stops = { {0.15, "#A75374" .. "30"}, {0.85, "#FFF577" .. "95"} } -- deep red to gold gradient
--})
--local silverbar  = gears.color({
--    type  = "linear",
--    from  = { dpi(32), dpi(32) },
--    to    = { dpi(32), 0 },
--    stops = {{5.9, "#9c9c9c" }, {0.1, "#bbbbbb" }} -- a bit more matte.
--})
--local ddcshiftholder = wibox.container.margin(ddcshift({
--     main_color = silverbar, background_color = "#343434", margins=6, shape = 'rectangle',}),
--      dpi(4), dpi(4), dpi(12), dpi(12)) -- 1080p
--local redshiftholder = wibox.container.margin(redshift({
--     main_color = cornershifter, background_color = "#343434", margins=6, shape = 'rectangle',}),
--      dpi(4), dpi(4), dpi(12), dpi(12)) -- 1080p
--
---------------------------------- [[ Creating the actual tag system ]] ------------------------------

function create_taglist(s)

    mytaglistcont2 = wibox.container.background(s.mytaglist3, "#ffffff" .. "00", gears.shape.rectangle)
    s.mytag2 = wibox.container.margin(mytaglistcont2, dpi(15), dpi(15), dpi(15), dpi(10))
end



-- Create the func -----------------------------------------------------------
function tagbar_horizontal(s)
	if s.index == 1
		then screen[1].mytagbar = tagbar {
     bg = gears.color.create_png_pattern(beautiful.tagbarbg),
--     bg = gears.color.create_png_pattern(beautiful.tagbarbg_light),
     screen = s,
     position = "bottom",
     size = 40,
     ontop = true,
     show_delay = 0.25,
     hide_delay = 0.2,
     easing = 1,
     delta = 50,
}
 screen[1].mytagbar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytag2,
        },
        { -- Right widgets
           layout = wibox.layout.fixed.horizontal,
           side_toggle,
        --  s.mytasklistholder, -- Middle widget
	    --ddcshiftholder,
	    --redshiftholder,
        },
    }
end
end

-- EOF ------------------------------------------------------------------------
