-- tagbarog (bottom) "panel"
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources") local dpi = xresources.apply_dpi
local rubato = require ("modules.rubato")
local tagbarog = require('extra.slidebars.tagbar')
local ddcshift = require('extra.bars.ddcshift')
local redshift = require('extra.bars.redshift')
local side_toggle = require('extra.toggleside')
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


---------------------------------- [[ Creating the actual tag system ]] ------------------------------

-- TAGBAR TAGLIST -----------------------------------------------------------------------------------
function create_taglist(s)

local origa_filter = awful.widget.taglist.filter.all
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return origa_filter(t, args)
end
end



   s.uppertag = awful.widget.taglist {
   screen  = s,
   filter  = origa_filter,
   style   = {
        bg_empty = "#00000000",
        bg_occupied = "#00000000",
        bg_focus = "#00000000",

       -- fg_empty = "#007fff00",
        fg_focus = "#007fff00",
       -- fg_focus = "#ff0000" .. "90",
        fg_occupied = "#000759" .. "90",
   },
   layout   = {
       spacing = 50,
       layout  = wibox.layout.fixed.horizontal
   },
      widget_template = {
       {
           {
            id     = 'text_role',
            widget = wibox.widget.textbox,
           },
           left  = 20,
           right = 20,
           widget = wibox.container.margin
       },
       id     = 'background_role',
       widget = wibox.container.background,
   }}














   s.mytaglist3 = awful.widget.taglist {
   screen  = s,
   filter  = origa_filter,
   --filter  = awful.widget.taglist.filter.all,
   style   = {
        bg_empty = beautiful.taglist_bg_empty_base .. "00",
        fg_empty = "#c2c3c2" .. "80",
        bg_occupied = beautiful.tagbarbutton,
        fg_focus = "#c2c3c2" .. "90",
        fg_occupied = "#c2c3c2" .. "90",
       bg_focus = "#8fA0FC",
       --bg_focus = gears.color.create_png_pattern(beautiful.side_panel_blue),
      -- bg_focus = sel_active
   },
   layout   = {
       spacing = 20,
       spacing_widget = {
           color  = '#dddddd' .. "00",
           bg  = '#ff0000' .. "00",
           widget = wibox.widget.separator,
       },
       layout  = wibox.layout.fixed.horizontal
   },
      widget_template = {
       {
	 {
           {
              {
                  text = " ",
                  font = "Iosevka 14",
                  widget = wibox.widget.textbox,
              },
               {
                   {
                       {
                           id     = 'index_role',
                           widget = wibox.widget.textbox,
                       },
                       margins = 2,
                       widget  = wibox.container.margin,
                   },
                   fg = '#dddddd10',
           --        bg     = '#dddddd',
                   widget = wibox.container.background,
               },
               {
                   {
                       id     = 'icon_role',
                       widget = wibox.widget.imagebox,
                   },
                   margins = 1,
                   widget  = wibox.container.margin,
               },
	       {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
               layout = wibox.layout.fixed.horizontal,
           },
           left  = 25,
           right = 25,
           widget = wibox.container.margin,
         },
	width = 300,
	height= 500,
	strategy = max,
        widget = wibox.container.constraint,
       },

       id     = 'background_role',
       widget = wibox.container.background,
       -- Add support for hover colors and an index label
       create_callback = function(self, c3, index, objects) --luacheck: no unused args
           self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
           self:connect_signal('mouse::enter', function()

               -- BLING: Only show widget when there are clients in the tag
               if #c3:clients() > 0 then
                   -- BLING: Update the widget with the new tag
                   awesome.emit_signal("bling::tag_preview::update", c3)
                   -- BLING: Show the widget
                   awesome.emit_signal("bling::tag_preview::visibility", s, true)
               end
               if self.bg ~= '#B57582' then
                   self.backup     = self.bg
                   self.has_backup = true
               end
               self.bg = '#B57582'
           end)
           self:connect_signal('mouse::leave', function()

       	         -- BLING: Turn the widget off
               awesome.emit_signal("bling::tag_preview::visibility", s, false)

               if self.has_backup then self.bg = self.backup end
           end)
       end,
       update_callback = function(self, c3, index, objects) --luacheck: no unused args
           self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
       end,
   },
   buttons = awful.util.taglist_buttons
   }



-- s.uppertag = wibox.container.background(s.uppertag, "#ffffff" .. "00", gears.shape.hexagon)
 s.uppertag = wibox.container.margin(s.uppertag, dpi(15), dpi(15), dpi(0), dpi(15))
--
--containing the widget to go inside
 mytaglistcont2 = wibox.container.background(s.mytaglist3, "#ffffff" .. "00", gears.shape.rectangle)
 s.mytag2 = wibox.container.margin(mytaglistcont2, dpi(15), dpi(15), dpi(15), dpi(-30))

tag_holder =  wibox.widget {
     s.mytag2,
--     s.uppertag,
--     vertical_offset = 15,
    layout  = wibox.layout.stack
}

tag_holder =  wibox.container.constraint(tag_holder, max, (screen.primary.geometry.width * 3 / 5 ), 500)

end
--------------------------------------------------------------------------------------------------------
-- Create the func -----------------------------------------------------------
function sleep(n)
	local t0 = os.clock()
	while os.clock() - t0 <= n do end
end

local barcoloro  = gears.color({ type  = "linear",
    from  = { dpi(32), 0 },
    to    = { dpi(32), dpi(32) },
    stops = { {0, beautiful.bg_focus .. "70"}, {0.25, "#202020"}}
})


local fly_in_time = 0.2
--do not move this for own sanity
local fly_in = rubato.timed {
	duration	= fly_in_time,
	intro		= fly_in_time/2,
	rate		= 90,
	pos		= 40,
	easing		= rubato.linear
}

-----------------------------------------------------------------------------------------------------
---- { CREATE THE TAGBAR } ------------------------------------------------------------------------
function create_tagbar(s)
dock = awful.popup {
    widget = {
        {
	tag_holder,
          --s.mytag2,
	  side_toggle,
        forced_height = 64,
        --forced_width  = (screen.primary.geometry.width ) * 4/8,
         layout = wibox.layout.fixed.horizontal,
        },
        margins = 10,
        widget  = wibox.container.background,
	shape = gears.shape.rounded_rect
    },
	--bg = "#ff000020",
	bg = barcoloro,
	border_width = 5,
        x = 0,
	screen = screen.primary,
	ontop = true,
	type = "dock",
	border_color = "#00000000",
}

local function adjust_x()
if screen.primary.geometry.width == 2560 then
	dock.x = (screen.primary.geometry.width)* 2/7
else
	dock.x = (screen.primary.geometry.width)* 1/5
end
end

adjust_x()

--keeps the widget centered as placement cant be used because of the animations
--s.mytag2:connect_signal("widget::layout_changed", function() adjust_x() end)

fly_in:subscribe(function(pos)
		dock:geometry({y = pos})
		dock:draw()
	end
)

--for startup and stuff
fly_in.target = screen.primary.geometry.height - beautiful.useless_gap + 20



----- SIGNALS ------------------------------------------------------------------
dock:connect_signal("mouse::enter", function()
--	open = true
	fly_in.target = screen.primary.geometry.height - (dock.height + beautiful.useless_gap) + 20
	open = true
end)
dock:connect_signal("mouse::leave", function()
--	open = false
	fly_in.target = screen.primary.geometry.height - beautiful.useless_gap + 20
	open = false
end)

end
    awesome.connect_signal(
      "bringup", function()
        fly_in.target = screen.primary.geometry.height - (dock.height + beautiful.useless_gap) + 20
--	      gears.timer.start_new(0.2, function() fly_in.target = screen.primary.geometry.height - (dock.height + beautiful.useless_gap) + 20 end )
	open = true
      end)
    awesome.connect_signal(
      "bringdown", function()
	fly_in.target = screen.primary.geometry.height - beautiful.useless_gap + 20
	open = false
      end)








-- EOF ------------------------------------------------------------------------
