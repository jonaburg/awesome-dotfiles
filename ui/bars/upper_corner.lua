local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources") local dpi = xresources.apply_dpi
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local lain = require("lain")
local markup = lain.util.markup
-- indicator --
local email = require('themes.winter22.extra.email')
--local starlprice = require('themes.grants.extra.starlprice')
local vm = require('extra.vmhunter')
--local gpuhunter = require('themes.winter22.extra.gpuhunter')
--local gputemps = require('themes.winter22.extra.gputemps')
local cputemps = require('extra.cputemps')

local volume_widget = require('extra.volume-widget.volume')
local wattage = require('extra.wattage')

local side_toggle = require('extra.toggleside')
--local rubato = require('modules.rubato')

--- WIDGETS
local space3 = markup.font("Roboto 3", " ")

local mytextclock = wibox.widget.textclock(markup(beautiful.widget_value_fg, "%a, %d. %b "))
local mytextclock2 = wibox.widget.textclock(markup(beautiful.widget_value_fg, " %H:%M" ))

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
local clockwidget = wibox.container.margin(full_clock_widget, dpi(20), dpi(20), dpi(2), dpi(2))
--local clockwidget = wibox.container.background(clockwidget, beautiful.panelcolor, gears.shape.rect) -- encapsulate for when running without bar present

-- EMAIL
emailholder = wibox.container.margin(email, dpi(2), dpi(2), dpi(5),dpi(5)) -- email
-- Computer stats Widgets --------------{{
-- WINDOWS VM identifier.
vmholder = wibox.container.margin(vm, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- GPU HOLDER(s)
--gpuhunter.bg = "#ff0000"
--gpuholder = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
--gpuholder_bright = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm

--gputempsholder_bright = wibox.container.margin(gputemps, dpi(0), dpi(0), dpi(5),dpi(5))
cputempsholder_bright = wibox.container.margin(cputemps, dpi(0), dpi(0), dpi(5),dpi(5))

-- starl price hodler
--starlpriceholder = wibox.container.margin(starlprice, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm



-- Battery
local bat = lain.widget.bat({
    settings = function()
        bat_header = "   "
        bat_p      = bat_now.perc .. " "
        if bat_now.ac_status == 1 then
            bat_header =  " "
            --bat_p = bat_p .. " "
        end
        --widget:set_markup(markup.font(beautiful.font, markup(blue, bat_header) .. bat_p))
        widget:set_markup(markup.font(beautiful.font, markup(beautiful.blue, bat_header) .. markup(beautiful.blue,bat_p)))
    end
})


-- CPU
local cpu = lain.widget.cpu({
	settings = function()
        widget:set_markup(markup.font(beautiful.widget_font, " 💽" .. cpu_now.usage .. "% "))
	end
})

local cpu_widget_icon = wibox.widget {
	text = " 💽",
	font = "Iosevka 10",
	widget = wibox.widget.textbox,
}
local cpu_widget_icon_handle = wibox.widget {
	cpu_widget_icon,
--	bg = "#7d88a6", -- purp
	bg = "#7E6EFF", -- purp
	fg = "#000000",
	widget = wibox.container.background,
}
local cpu_bg_handle = wibox.widget {
	cpu,
	--fg = beautiful.blue_use, -- purp
	fg = beautiful.purp, -- purp
	widget = wibox.container.background,
}
local full_cpu_widget = wibox.widget {
	--cpu_widget_icon_handle -- bluebg,
        cpu_bg_handle,
	layout = wibox.layout.fixed.horizontal,
}
local cpuwidget = wibox.container.margin(full_cpu_widget, dpi(0), dpi(0), dpi(5), dpi(5))

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
volumewidget = wibox.container.margin(volumewidget, dpi(3), dpi(3), dpi(12), dpi(12))

-- System Tray --- this hides the system tray as its packed inside of this widget. --
--systrayholder = wibox.container.margin(wibox.widget.systray0 dpi(16), dpi(16), dpi(7),dpi(7)) -- sytstray
mysystray = wibox.widget.systray()
mysystray.visible = false
systrayholder = wibox.container.margin(mysystray, dpi(5), dpi(5), dpi(7),dpi(7)) -- sytstray
systrayholder:connect_signal("mouse::enter", function() show_systray() end)
systrayholder:connect_signal("mouse::leave", function() hide_systray() end)
function show_systray() mysystray.visible = true end
function hide_systray() mysystray.visible = false end


-- Create the func -----------------------------------------------------------
function main_upper_bar(s)
-- Create the main taskbar wibox.
mywibox = awful.wibar(
        {
         screen = s,
         height = dpi(32),
         width = s.workarea.width,
         --bg = gears.color.create_png_pattern(beautiful.panelbg),
         bg = "#00000000",
        visible = true,
         shape = gears.shape.rectangle
        }
    )
    mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        { -- Left widgets

            layout = wibox.layout.fixed.horizontal,
	    wibox.container.background(wibox.widget {

--            	emailholder,
--                clockwidget,
--            	cputempsholder_bright,
--                cpuwidget,
--		wattage,
--		bat.widget,
--            	volume_widget{
--                      widget_type = 'horizontal_bar'
--                    }, -- self explanatory
--                --s.mylayoutbox,
--                systrayholder,
--		side_toggle,



 --           mytagholder,
            s.mypromptbox,
	    layout = wibox.layout.fixed.horizontal,
    }, beautiful.panelcolor, gears.shape.rect),
            max_widget_size = 50,
        },
        {
            layout = wibox.layout.flex.horizontal,
           -- clockwidget,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            wibox.container.background(wibox.widget {
            	emailholder,
                clockwidget,
            	cputempsholder_bright,
                cpuwidget,
		wattage,
		bat.widget,
            	volume_widget{
                      widget_type = 'horizontal_bar'
                    }, -- self explanatory
                --s.mylayoutbox,
		side_toggle,
                systrayholder,
	     layout = wibox.layout.fixed.horizontal,
            }, beautiful.panelcolor, gears.shape.rounded_rect),
    },
    }

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

end


-- EOF ------------------------------------------------------------------------
