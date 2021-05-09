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

---------------------------------- [[Setting up ddcshift and redshift ]]---------------------------
local cornershifter = gears.color({
	type = "linear",
	from = { dpi(12), 0},
	to   = { dpi(182), 20},
	stops = { {0.15, "#A75374" .. "30"}, {0.85, "#FFF577" .. "95"} } -- deep red to gold gradient
})
local silverbar  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    stops = {{5.9, "#9c9c9c" }, {0.1, "#bbbbbb" }} -- a bit more matte.
})
local ddcshiftholder = wibox.container.margin(ddcshift({
     main_color = silverbar, background_color = "#343434", margins=6, shape = 'rectangle',}),
      dpi(4), dpi(4), dpi(12), dpi(12)) -- 1080p
local redshiftholder = wibox.container.margin(redshift({
     main_color = cornershifter, background_color = "#343434", margins=6, shape = 'rectangle',}),
      dpi(4), dpi(4), dpi(12), dpi(12)) -- 1080p

-------------------------------- [[ Creating the actual tag system ]] ------------------------------

---- TAGBAR TAGLIST
--    s.mytaglist3 = awful.widget.taglist {
--    screen  = s,
--    --filter  = awful.widget.taglist.filter.all,
--    filter  = orig_filter,
--    style   = {
--         --bg_empty = beautiful.taglist_bg_empty_base .. "00",
--         bg_empty = "#121212",
--         fg_empty = "#c2c3c2" .. "80",
--        bg_occupied = "#ff0000",
--        --bg_occupied = tagbarbutton,
--        --bg_occupied = googlegreen,
--
--         fg_focus = "#c2c3c2" .. "80",
--         fg_occupied = "#c2c3c2" .. "80",
--        bg_focus = "#b3b3b2",
--    },
--    layout   = {
--        spacing = 30,
--        spacing_widget = {
--            color  = '#dddddd' .. "00",
--            bg  = '#ff0000' .. "00",
--            widget = wibox.widget.separator,
--        },
--        layout  = wibox.layout.fixed.horizontal
--    },
--
--       widget_template = {
--        {
--            {
--               {
--                   text = " ",
--                   font = "Iosevka 14",
--                   widget = wibox.widget.textbox,
--               },
--                {
--                    {
--                        {
--                            id     = 'index_role',
--                            widget = wibox.widget.textbox,
--                        },
--                        margins = 2,
--                        widget  = wibox.container.margin,
--                    },
--                    fg = '#dddddd' ..'50',
--            --        bg     = '#dddddd',
--            --       shape  = gears.shape.circle,
--                    widget = wibox.container.background,
--                },
--                {
--                    {
--                        id     = 'icon_role',
--                        widget = wibox.widget.imagebox,
--                    },
--                    margins = 3,
--                    widget  = wibox.container.margin,
--                },
--                layout = wibox.layout.fixed.horizontal,
--            },
--            left  = 25,
--            right = 25,
--            widget = wibox.container.margin
--        },
--
--        id     = 'background_role',
--        widget = wibox.container.background,
--        -- Add support for hover colors and an index label
--        create_callback = function(self, c3, index, objects) --luacheck: no unused args
--            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
--            self:connect_signal('mouse::enter', function()
--
--                -- BLING: Only show widget when there are clients in the tag
--                if #c3:clients() > 0 then
--                    -- BLING: Update the widget with the new tag
--                    awesome.emit_signal("bling::tag_preview::update", c3)
--                    -- BLING: Show the widget
--                    awesome.emit_signal("bling::tag_preview::visibility", s, true)
--                end
--
--                if self.bg ~= '#B57582' then
--                    self.backup     = self.bg
--                    self.has_backup = true
--                end
--                self.bg = '#B57582'
--            end)
--            self:connect_signal('mouse::leave', function()
--
--		         -- BLING: Turn the widget off
--                awesome.emit_signal("bling::tag_preview::visibility", s, false)
--
--                if self.has_backup then self.bg = self.backup end
--            end)
--        end,
--        update_callback = function(self, c3, index, objects) --luacheck: no unused args
--            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
--        end,
--    },
--    buttons = awful.util.taglist_buttons
--}
--
--    local mytaglistcont2 = wibox.container.background(s.mytaglist3, "#ffffff" .. "00", gears.shape.rectangle)
--    s.mytag2 = wibox.container.margin(mytaglistcont2, dpi(15), dpi(15), dpi(15), dpi(10))
--



-- Create the func -----------------------------------------------------------
function tagbar_hor(s)
	if s.index == 1
		then screen[1].mytagbar = tagbar {
     bg = gears.color.create_png_pattern(beautiful.tagbarbg),
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
            s.mytasklistholder, -- Middle widget
	    ddcshiftholder,
	    redshiftholder,
        },
    }
end
end

gears.timer.delayed_call(tagbar_hor, s)
-- EOF ------------------------------------------------------------------------
