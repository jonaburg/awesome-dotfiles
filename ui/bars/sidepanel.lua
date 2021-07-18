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
local email = require('themes.concencolor.extra.email')
local vm = require('extra.vmhunter')
local gpuhunter = require('themes.concencolor.extra.gpuhunter')
local gputemps = require('themes.concencolor.extra.gputemps')

-- ddcshift and redshift --
local ddcshift = require('extra.bars.ddcshift')
local redshift = require('extra.bars.redshift')

-- psoman toggle icon --
local side_toggle = require('extra.toggleside')

--- WIDGETS
local space3 = markup.font("Roboto 3", " ")
local mytextclock = wibox.widget.textclock(markup("#c3c2c3", "%a, %d. %b "))
local mytextclock2 = wibox.widget.textclock(markup("#c3c2c3", " %H:%M" ))
local clockbg = wibox.container.background(mytextclock, beautiful.widget_value_bg, gears.shape.rectangle)
local clockbg2 = wibox.container.background(mytextclock2, beautiful.widget_value_bg, gears.shape.rectangle)
local full_clock_widget = wibox.widget {
	clockbg, -- calendar
	clockbg2, -- clock
	layout = wibox.layout.fixed.horizontal,
}

-- Calendar
local mytextcalendar = wibox.widget.textclock(markup.fontfg(beautiful.font, "#FFFFFF", space3 .. "%d %b " .. markup.font("Roboto 5", " ")))
local calendar_icon = wibox.widget.imagebox(beautiful.calendar)
local calbg = wibox.container.background(mytextcalendar, beautiful.bg_focus, gears.shape.rectangle)

local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(0), dpi(0), dpi(0))
beautiful.cal = lain.widget.cal({
    attach_to = { mytextclock, mytextcalendar },
    notification_preset = {
        fg = "#FFFFFF",
        bg = beautiful.bg_normal,
        position = "top_middle",
        font = "Iosevka 14"
    }
})
local clockwidget = wibox.container.margin(full_clock_widget, dpi(0), dpi(0), dpi(5), dpi(5))

-- EMAIL
emailholder = wibox.container.margin(email, dpi(8), dpi(0), dpi(5),dpi(5)) -- email
-- Computer stats Widgets --------------{{
-- WINDOWS VM identifier.
vmholder = wibox.container.margin(vm, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- GPU HOLDER(s)
--gpuhunter.bg = "#ff0000"
gpuholder = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
gputempsholder = wibox.container.margin(gputemps, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm

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



start_x = -451
start_y = -1

local panel_anim = awestore.tweened(-451, {
	duration = 3500,
	easing = awestore.easing.circ_in_out
})
local strut_anim = awestore.tweened(200, {
	duration = 3500,
	easing = awestore.easing.circ_in_out
})

panel_anim:subscribe(function(x) start_x = 0 end)

-- signal to connect to, in order to autohide/unhide when called with "keybind" ----------
awesome.connect_signal("widget::panel::toggle", function ()
	if not mysidepanel.visible then
		mysidepanel.visible = true
		mysidepanel2.visible = true
		strut_anim:set(451)
		panel_anim:set(-2 + beautiful.useless_gap)

        else
		strut_anim:set(0)
		panel_anim:set(-451)
	     mysidepanel.visible = false
             mysidepanel2.visible = false

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
                       width = s.workarea.width / 3,
                       x = 0,
		               y = 45,
                       bg = gears.color.create_png_pattern(beautiful.side_panel_darker_bg),
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
                            cpuwidget,
              	           emailholder,
                            s.mytasklistholder, -- Middle widget
                           clockwidget,
                            side_toggle,
                      },
                      { -- bottom widgets
                          layout = wibox.layout.flex.vertical,
                          --s.mytasklistholder, -- Middle widget
			              ddcshiftholder,
			              redshiftholder,
                          max_widget_size = 50
                      },
                  }
    end
-- side panel screen 2
    if s.index == 2
	    then
              mysidepanel2 = wibox(
                      {
                       screen = s,
                       height = s.workarea.height,
                       width = s.workarea.width / 3,
                       x = 0,
                       y = 50,
                       bg = gears.color.create_png_pattern(beautiful.side_panelbg),
                       visible = false,
              	       ontop  = true,
                       shape = gears.shape.rectangle
                      }
                  )
                  mysidepanel2:setup {
                      layout = wibox.layout.align.vertical,
                      expand = 'none',
                      {
                          layout = wibox.layout.flex.vertical,
                          clockwidget,
			  ddcshiftholder,
			  redshiftholder,
                          s.mytasklistholder, -- Middle widget

                      },
                      { -- Right widgets
                        layout = wibox.layout.fixed.horizontal,
                          cpuwidget,
              	          emailholder,
                      },
                  }

    end


end

-- EOF ------------------------------------------------------------------------
