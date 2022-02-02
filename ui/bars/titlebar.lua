local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources") local dpi = xresources.apply_dpi
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local lain = require("lain")
local markup = lain.util.markup
local rubato = require("modules.rubato")



--direction = 1

local fly_in_time = 0.1 --do not move this for own sanity
local fly_in = rubato.timed {
	duration	= fly_in_time,
	intro		= fly_in_time/4,
	rate		= 90,
	pos		= screen.primary.geometry.width / 2,
	easing		= rubato.linear
}
function create_titlebar(s)
   s.titlebar_taglist = awful.widget.taglist(s, function(t, args) return t.selected end, awful.util.taglist_buttons, {
         bg_focus = "#B6BD68",
         --bg_focus = beautiful.highlight,
         spacing = 4,
          font = beautiful.titlebar_font,
        })
   s.titlebar_tag = wibox.container.margin(s.titlebar_taglist, dpi(3), dpi(3), dpi(3), dpi(3))
   titlebar_tagholder = wibox.container.background(s.titlebar_tag, beautiful.bg_normal, gears.shape.rectangle)

if s.index == 1
then

 s.mytasklistholder2 = wibox.container.margin(s.mytasklist, dpi(0), dpi(0), dpi(0), dpi(0))

-- Create the main taskbar wibox.
thetitlebar = awful.wibar(
        {
         screen = s,
         height = dpi(32),
         width = s.workarea.width / 2,
         bg = gears.color.create_png_pattern(beautiful.panelbg),
         --bg = "#00000000",
        visible = true,
        --visible = false,
	ontop = true,
         shape = gears.shape.rectangle
        }
    )
    thetitlebar:setup {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
	    wibox.container.background(wibox.widget {
	 --   titlebar_tagholder,
            --mytagholder,
            --s.mypromptbox,
	    layout = wibox.layout.fixed.horizontal,
    }, beautiful.panelcolor, gears.shape.rect),
            max_widget_size = 50,
        },
        { -- MIDDLE widgfets
	s.mytasklistholder2,
	    --titlebar_tagholder,
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.container.background(wibox.widget {
	     layout = wibox.layout.fixed.horizontal,
            }, beautiful.panelcolor, gears.shape.rounded_rect),
    },
    }


if screen.primary.geometry.width == 1920 then
    --thetitlebar.y = 1110
    thetitlebar.y = 0
else
    --thetitlebar.y = 1320
    thetitlebar.y = 0
end

-- if main screen then indent topbar down. (specific to main 3k monitor)
--    if s.index == 1
--    then
--        ----- {{ TOP BAR}}
--         mywibox.height = dpi(38)
--         --screen[1].mywibox.width = s.workarea.width - 50
--         mywibox.width = s.workarea.width
--         mywibox.y = 0
--         --screen[1].mywibox.x = 20
--         mywibox.x = 0
--         --screen[1].mywibox:struts({left=0, right=0, top=85, bottom=0})
--         mywibox:struts({left=0, right=0, top=45, bottom=0})
--    end


local function adjust_x()
if screen.primary.geometry.width == 2560 then
	thetitlebar.x = (screen.primary.geometry.width)* 2/7
else
	thetitlebar.x = (screen.primary.geometry.width)* 1/2
end
end
adjust_x()
fly_in:subscribe(function(pos)
		thetitlebar:geometry({x = pos})
		thetitlebar:draw()
	end
)
--for startup and stuff
fly_in.target = 2000


----- SIGNALS ------------------------------------------------------------------
--thetitlebar:connect_signal("mouse::enter", function()
----	open = true
--	fly_in.target = screen.primary.geometry.height
--	open = true
--end)
--
--thetitlebar:connect_signal("mouse::leave", function()
----	open = false
--	fly_in.target = screen.primary.geometry.height
--	open = false
--end)


--awesome.connect_signal(
--  "bringup", function()
-- --     if screen.primary.geometry.width == 2560 then
---- thetitlebar.visible = true
--        --pos = ( screen.primary.geometry.width / 2  ) -  700
--        pos = -1400
--        fly_in.target = -100
-- --     else
-- --             --thetitlebar.visible = true
-- --       pos = ( screen.primary.geometry.width / 2  ) -  800
-- --       fly_in.target = 0
-- --      -- fly_in.target = ( screen.primary.geometry.width / 2  ) -  500
-- --     end
--    open = true
--
--  end)
--
awesome.connect_signal(
  "bringdown", function()
    fly_in.target = pos
    --          thetitlebar.visible = false
   open = false

 --   if direction == 1 then
 --           direction = 0
 --   else direction = 1
 --   end

  end)


  function get_tag_at_offset(i, s)
    s = screen[s or awful.screen.focused()]
    local tags = s.tags
    local showntags = {}
    for _, t in pairs(tags) do
        if not awful.tag.getproperty(t, "hide") then
            table.insert(showntags, t)
        end
    end
    for k, t in ipairs(showntags) do
        if t == sel then
            return showntags[gears.math.cycle(#showntags, k + i)]
        end
    end
end

awful.screen.focused():connect_signal("tag::history::update", function()
--	if get_tag_at_offset(1) > get_tag_at_offset(-1) then
--	      thetitlebar.visible = false
--        else
--	      thetitlebar.visible = true
--        end
--	      thetitlebar.visible = true
        pos = -1400
        fly_in.target = -100

  end)
--
--
end



end


-- EOF ------------------------------------------------------------------------
