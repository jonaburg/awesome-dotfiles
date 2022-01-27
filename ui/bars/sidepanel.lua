local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources") local dpi = xresources.apply_dpi
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local lain = require("lain")
local markup = lain.util.markup
local awestore = require("awestore")

-- indicator --
--local email = require('themes.concencolor.extra.email')
local vm = require('extra.vmhunter')
--local gpuhunter = require('themes.concencolor.extra.gpuhunter')
--local gputemps = require('themes.concencolor.extra.gputemps')


-- additional
local verbosebat = require('extra.verbosebat')
local wattage = require('extra.wattage')
-- ddcshift and redshift --
local ddcshift = require('extra.bars.ddcshift')
local redshift = require('extra.bars.redshift')

-- psoman toggle icon --
local side_toggle = require('extra.toggleside')

local clockwidget = wibox.container.margin(full_clock_widget, dpi(0), dpi(0), dpi(5), dpi(5))

-- EMAIL
--emailholder = wibox.container.margin(email, dpi(8), dpi(0), dpi(5),dpi(5)) -- email
-- Computer stats Widgets --------------{{
-- WINDOWS VM identifier.
vmholder = wibox.container.margin(vm, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- GPU HOLDER(s)
--gpuhunter.bg = "#ff0000"
--gpuholder = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
--gputempsholder = wibox.container.margin(gputemps, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm

verbosebatholder = wibox.container.margin(verbosebat, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- Battery
local bat = lain.widget.bat({
    settings = function()
        bat_header = " Bat "
        bat_p      = bat_now.perc .. " "
        if bat_now.ac_status == 1 then
            bat_p = bat_p .. "Plugged "
        end
        widget:set_markup(markup.font(beautiful.font, markup(blue, bat_header) .. bat_p))
    end
})


-- CPU
local cpu = lain.widget.cpu({
	settings = function()
        widget:set_markup(markup.font(beautiful.widget_font, "  " .. cpu_now.usage .. "% "))
	end
})

local cpu_widget_icon = wibox.widget {
	text = "    ",
	font = "Iosevka 10",
	widget = wibox.widget.textbox,
}
local cpu_widget_icon_handle = wibox.widget {
	cpu_widget_icon,
	bg = "#7d88a6", -- purp
	fg = "#000000",
	widget = wibox.container.background,
}
local cpu_bg_handle = wibox.widget {
	cpu,
	fg = "#7d88a6", -- purp
	widget = wibox.container.background,
}
local full_cpu_widget = wibox.widget {
        cpu_bg_handle,
	layout = wibox.layout.fixed.horizontal,
}
local cpuwidget = wibox.container.margin(full_cpu_widget, dpi(0), dpi(0), dpi(5), dpi(5))

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
	main_color = silverbar, background_color = "#343434", margins=2, shape = 'rectangle',}),
	dpi(20), dpi(40), dpi(2), dpi(2))

local redshiftholder = wibox.container.margin(redshift({
	main_color = cornershifter, background_color = "#343434", margins=2, shape = 'rectangle',}),
	dpi(20), dpi(40), dpi(2), dpi(2))



	--- Volume --

-- ALSA volume bar
beautiful.volume = lain.widget.alsabar({
    notification_preset = { font = "Monospace 14"},
    width = dpi(150), height = dpi(1), border_width = dpi(0),ticks = false, tick_size=3, -- max width for all bars is equiv to this width.
    colors = {
        background = "#343434",
        unmute     = "#7289DA",
        mute       = "#FF9F9F"
    },
})
beautiful.volume.bar.paddings = dpi(1)
beautiful.volume.bar.margins = dpi(1)
beautiful.volume.bar:buttons(awful.util.table.join(
    awful.button({}, 3, function() -- left click
        awful.spawn(string.format("%s -e alsamixer", terminal))
    end),

    awful.button({}, 2, function() -- middle click
        awful.spawn(string.format("%s -e ncmpcpp", terminal))
    end),

    awful.button({}, 1, function() -- right click
        os.execute(string.format("%s set %s toggle", beautiful.volume.cmd, beautiful.volume.togglechannel or beautiful.volume.channel))
        beautiful.volume.update()
    end),

    awful.button({}, 4, function() -- scroll up
        os.execute(string.format("%s set %s 1%%+", beautiful.volume.cmd, beautiful.volume.channel))
        beautiful.volume.update()
    end),

    awful.button({}, 5, function() -- scroll down
        os.execute(string.format("%s set %s 1%%-", beautiful.volume.cmd, beautiful.volume.channel))
        beautiful.volume.update()
    end)
    ))

local volumewidget = wibox.container.background(beautiful.volume.bar, beautiful.bg_focus, gears.shape.rectangle)
volumewidget = wibox.container.margin(volumewidget, dpi(20), dpi(40), dpi(5), dpi(5))





-- signal to connect to, in order to autohide/unhide when called with "keybind" ----------
local panel_anim = awestore.tweened(3000, {
	duration = 350,
	easing = awestore.easing.cubic_in_out
})

awesome.connect_signal("widget::panel::toggle", function ()
	if not mysidepanel.visible then
		mysidepanel.visible = true
		--mysidepanel2.visible = true
		--panel_anim:set(1800)
		--panel_anim:set(2050)
		panel_anim:set(1305) -- normal only laptop mode
--		panel_anim:set(1540) -- d mode
    else
	panel_anim:set(3000) -- normal nonly laptop mode
--	panel_anim:set(1300) -- d moide
 local unsub_panel
 unsub_panel = panel_anim.ended:subscribe (
 function()
	      mysidepanel.visible = false
          --mysidepanel2.visible = false
unsub_panel()
end)

	end
end)



-- Create the func -----------------------------------------------------------
function side_panel(s)
    -- Create the first side_panel wibox. If there is only 1 monitor, there will only be this one..
    -- make sure this is on screen 1 only. --
    if s.index == 1
	    then
              mysidepanel = wibox(
                      {
                       screen = s,
                       height = s.workarea.height,
                       width = s.workarea.width / 5,
		       y = 30,
                       x = 0,
		       bg = gears.color.create_png_pattern(beautiful.side_panelbg),
                       --bg = "#121212",
                       visible = false,
              	       ontop  = true,
                       shape = gears.shape.rectangle
                      }
                  )
                  mysidepanel:setup {
                      layout = wibox.layout.align.vertical,
                      expand = 'none',
                      { -- top widgets
                          layout = wibox.layout.fixed.vertical,
                      },
                      { -- middle widgets
                          layout = wibox.layout.flex.vertical,
              	           --emailholder,
                           -- s.mytasklistholder, -- Middle widget
                           clockwidget,
                      },
                      { -- bottom widgets
                          layout = wibox.layout.flex.vertical,
                          --s.mytasklistholder, -- Middle widget
                          side_toggle,
                            s.mytasklistholder, -- Middle widget
			    verbosebat,
			   -- wattage,
			  ddcshiftholder,
			  redshiftholder,
			  volumewidget,
                          max_widget_size = 50
                      },
                  }
    end

mysidepanel.x = 1550
--panel_anim:subscribe(function(x) mysidepanel.x = x end)


-- --side panel screen 2
--    if s.index == 2
--	    then
--             mysidepanel2 = wibox(
--                     {
--                      screen = s,
--                      height = s.workarea.height,
--                      width = s.workarea.width / 3,
--                      x = 0,
--                      y = 50,
--                      bg = gears.color.create_png_pattern(beautiful.side_panel_blue),
--                      visible = false,
--             	       ontop  = true,
--                      shape = gears.shape.rectangle
--                     }
--                 )
--                 mysidepanel2:setup {
--                     layout = wibox.layout.align.vertical,
--                     expand = 'none',
--                     { -- top widgets
--                         layout = wibox.layout.fixed.vertical,
--                     },
--                     { -- middle widgets
--                         layout = wibox.layout.flex.vertical,
--                           cpuwidget,
--             	           emailholder,
--                           s.mytasklistholder, -- Middle widget
--                          clockwidget,
--                     },
--                     { -- bottom widgets
--                         layout = wibox.layout.flex.vertical,
--                         --s.mytasklistholder, -- Middle widget
--                         side_toggle,
--		              ddcshiftholder,
--		              redshiftholder,
--                         max_widget_size = 50
--                     },
--                 }
--
-- end

-- for some reason mysidepanel2 is not recognized. so far this config works with teh sidebar opening for just screen 1 (same screen as tagbar atm)

--mysidepanel2.x = -1000
--panel_anim:subscribe(function(x) mysidepanel2.x = x end)


end

-- EOF ------------------------------------------------------------------------
