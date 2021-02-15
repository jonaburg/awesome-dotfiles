--[[
	JB sidebar work in progress..
	includes 2nd monitor vertical bar && better handling of tag switching.
        Spring Switzerland Awesome WM theme 3.0 2020

--]]
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local math, string, tag, tonumber, type, os = math, string, tag, tonumber, type, os
local naughty = require("naughty")
local theme_assets = require("beautiful.theme_assets")
local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme                                     = {}
-- i added these...
	local uptime_widget = require("extra.uptime")
	local test_widget = require("extra.testwidget")
	local corona_widget = require("extra.corona")
	local coronauk_widget = require("extra.coronauk")
	local coronarecovered_widget = require("extra.coronarecovered")
	local coronafull_widget = require("extra.coronafull")
	local rates_widget = require("RateWidget.rates")
	local email_widget = require("extra.email")
	local news_widget = require("extra.newsboat")
	local windowsvm = require("extra.windowsvm")
	local waterflowers = require("extra.waterflowers")
	local redshift = require("extra.redshift")
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/spring2"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/spring2/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/spring2/wall.png"
theme.wallpaper2                                 = os.getenv("HOME") .. "/.config/awesome/themes/spring2/winter.png"
theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/themes/spring2"



--- {{{	 	TAG SWITCH BEHAVIOUR
--- 	multiple TAG RICING
--wp_path= "/home/jon/.config/awesome/themes/spring2/papes1/"
--wp_path= "/home/jon/.config/awesome/themes/spring2/papes2/"
wp_path= "/home/jon/.config/awesome/themes/spring2/papes/"
wp_files = { "pape1.jpg","pape2.jpg","pape3.jpg","pape4.jpg","pape5.jpg","pape6.jpg","pape7.jpg", "pape8.jpg", "pape9.jpg" }

xres_path = "/home/jon/Documents/Xresources/"
xres_files = {"lambdaneutral", "wheat", "paladin", "navyblue", "lavaside", "lambdaneutral"}

-- per tag wallpapers && xresources...
screen[1]:connect_signal("tag::history::update", function()
       if awful.tag.selected(1).name == "1" then
             gears.wallpaper.maximized(wp_path .. wp_files[1], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[1]  )
	     screen[1]:emit_signal("tag1")
elseif awful.tag.selected(1).name == "2"
	then gears.wallpaper.maximized(wp_path .. wp_files[2], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[2]  )
	     screen[1]:emit_signal("tag2")
elseif awful.tag.selected(1).name == "3"
	then gears.wallpaper.maximized(wp_path .. wp_files[3], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[3]  )
	     screen[1]:emit_signal("tag3")
elseif awful.tag.selected(1).name == "4"
	then gears.wallpaper.maximized(wp_path .. wp_files[4], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[4]  )
	     screen[1]:emit_signal("tag4")
elseif awful.tag.selected(1).name == "5"
	then gears.wallpaper.maximized(wp_path .. wp_files[5], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[5]  )
	     screen[1]:emit_signal("tag5")
elseif awful.tag.selected(1).name == "6"
	then gears.wallpaper.maximized(wp_path .. wp_files[6], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[3]  )
	     screen[1]:emit_signal("tag6")
elseif awful.tag.selected(1).name == "7"
	then gears.wallpaper.maximized(wp_path .. wp_files[7], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[4]  )
	     screen[1]:emit_signal("tag7")
elseif awful.tag.selected(1).name == "8"
	then gears.wallpaper.maximized(wp_path .. wp_files[8], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[6]  )
	     screen[1]:emit_signal("tag8")
elseif awful.tag.selected(1).name == "9"
	then gears.wallpaper.maximized(wp_path .. wp_files[9], s, true)
	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[6]  )
	     screen[1]:emit_signal("tag9")
	end
end)
--- }}}


------------------------------------
--screen[2]:connect_signal("tag::history::update", function()
--       if awful.tag.selected(2).name == "1" then
--             gears.wallpaper.maximized(wp_path .. wp_files[1], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[1]  )
--	     screen[2]:emit_signal("tag1")
--elseif awful.tag.selected(2).name == "2"
--	then gears.wallpaper.maximized(wp_path .. wp_files[2], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[2]  )
--	     screen[2]:emit_signal("tag2")
--elseif awful.tag.selected(2).name == "3"
--	then gears.wallpaper.maximized(wp_path .. wp_files[3], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[3]  )
--	     screen[2]:emit_signal("tag3")
--elseif awful.tag.selected(2).name == "4"
--	then gears.wallpaper.maximized(wp_path .. wp_files[4], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[4]  )
--	     screen[2]:emit_signal("tag4")
--elseif awful.tag.selected(2).name == "5"
--	then gears.wallpaper.maximized(wp_path .. wp_files[5], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[2]  )
--	     screen[2]:emit_signal("tag5")
--elseif awful.tag.selected(2).name == "6"
--	then gears.wallpaper.maximized(wp_path .. wp_files[6], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[3]  )
--	     screen[2]:emit_signal("tag6")
--elseif awful.tag.selected(2).name == "7"
--	then gears.wallpaper.maximized(wp_path .. wp_files[7], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[4]  )
--	     screen[2]:emit_signal("tag7")
--elseif awful.tag.selected(2).name == "8"
--	then gears.wallpaper.maximized(wp_path .. wp_files[8], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[3]  )
--	     screen[2]:emit_signal("tag8")
--elseif awful.tag.selected(2).name == "9"
--	then gears.wallpaper.maximized(wp_path .. wp_files[9], s, true)
--	     awful.spawn( 'xrdb -load ' .. xres_path .. xres_files[4]  )
--	     screen[2]:emit_signal("tag9")
--	end
--end)

-----automatic wp switcher based on timer.
----------------------
---- configuration - edit to your liking
--wp_index = 1
--wp_timeout  = 10
--wp_path = "/home/jon/.config/awesome/themes/spring2/"
--wp_files = { "wall.png", "winter.png"}
-- ---- setup the timer
--wp_timer = timer { timeout = wp_timeout }
--wp_timer:connect_signal("timeout", function()
-- --  -- set wallpaper to current index for all screens
--  for s = 1, screen.count() do
--    gears.wallpaper.maximized(wp_path .. wp_files[wp_index], s, true)
--  end
-- --  -- stop the timer (we don't need multiple instances running at the same time)
--  wp_timer:stop()
-- --  -- get next random index
--  wp_index = math.random( 1, #wp_files)
-- --  --restart the timer
--  wp_timer.timeout = wp_timeout
--  wp_timer:start()
--end)
--
---- initial start when rc.lua is first run
--wp_timer:start()
--------------------------------------
-- transparent/ global color declarations
local side_color 				= "#000000" .. "95" -- dark
--local side_color 				= "#001326"  -- darker no trans
--local side_color 				= "#001326"  .. "85" -- darker
--local side_color 				= "#6d6d6d"  .. "85" -- lighter
local tag_color = "#7a7a7a"  -- some kinda brown

theme.font          = "Iosevka 10"
theme.taglist_font  = "Iosevka 12"
theme.mpd_font  = "Iosevka 10"
theme.tasklist_font = "Iosevka 12"
--theme.fg_normal                                 = "#3f71e9"
theme.fg_normal                                 = "#cecece"
theme.fg_focus					= "#000000"
theme.bg_focus                                  = "#cecece" .. "55"
theme.bg_normal                                 = "#000000" .. "55"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(3)
--theme.border_normal                             = "#252525" .. "05"
theme.border_normal                             = "#252525"
theme.border_focus                              = "#6AC8C0"

--taglist colors
theme.taglist_fg_focus                          = "#FFFFFF"
theme.taglist_bg_empty = "#0a0e15"
theme.taglist_bg_focus = "#121a26"
theme.taglist_bg_occupied = "#121a26"
theme.taglist_fg_occupied = "#b1afa0"

theme.tasklist_bg_normal                        = "#000000"
theme.tasklist_fg_focus                         = "#a4d0cc"
theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(200)
theme.menu_icon_size                            = dpi(32)
theme.useless_gap                               = dpi(35)
theme.awesome_icon                              = theme.icon_dir .. "/awesome_icon_white.png"
theme.awesome_icon_launcher                     = theme.icon_dir .. "/awesome_icon.png"
theme.taglist_squares_sel                       = theme.icon_dir .. "/icons/stopsel.png"
theme.taglist_squares_unsel                     = theme.icon_dir .. "/icons/stopsel2.png"
theme.spr_small                                 = theme.icon_dir .. "/spr_small.png"
theme.spr_very_small                            = theme.icon_dir .. "/spr_very_small.png"
theme.spr_right                                 = theme.icon_dir .. "/spr_right.png"
theme.spr_bottom_right                          = theme.icon_dir .. "/spr_bottom_right.png"
theme.spr_side                        		    = theme.icon_dir .. "/spr_side.png"
theme.spr_left                                  = theme.icon_dir .. "/spr_left.png"
theme.bar                                       = theme.icon_dir .. "/bar3.png"
theme.gradbar                                       = theme.icon_dir .. "/gradbar.png"
theme.transbar                                       = theme.icon_dir .. "/transbar.png"
theme.transpace                                       = theme.icon_dir .. "/transpace.png"
theme.transquare                                       = theme.icon_dir .. "/transquare.png"
--theme.gradbar                                       = theme.icon_dir .. "/gradbarplain.png"
--theme.bar                                       = theme.icon_dir .. "/bluebox.png"
theme.bottom_bar                                = theme.icon_dir .. "/bottom_bar.png"
theme.mpdl                                      = theme.icon_dir .. "/mpd.png"
theme.mpd_on                                    = theme.icon_dir .. "/mpd_on.png"
theme.prev                                      = theme.icon_dir .. "/prev.png"
theme.nex                                       = theme.icon_dir .. "/next.png"
theme.stop                                      = theme.icon_dir .. "/stop.png"
theme.pause                                     = theme.icon_dir .. "/pause.png"
theme.play                                      = theme.icon_dir .. "/play.png"
theme.clock                                     = theme.icon_dir .. "/icons/clock.png"
theme.calendar                                  = theme.icon_dir .. "/cal.png"
theme.cpu                                       = theme.icon_dir .. "/cpu.png"
theme.net_up                                    = theme.icon_dir .. "/net_up.png"
theme.net_down                                  = theme.icon_dir .. "/net_down.png"
theme.layout_tile                               = theme.confdir .. "/icons/masterslave.png"
theme.layout_cascade                            = theme.confdir .. "/icons/magnify.png"
theme.layout_uselesstile                        = theme.confdir .. "/icons/monomate.png"
theme.layout_floating                           = theme.icon_dir .. "/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.titlebar_close_button_normal              = theme.default_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.default_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.default_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.default_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.default_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.default_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.default_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.default_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.default_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.default_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.default_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.default_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.default_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.default_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.default_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.default_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.default_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.default_dir.."/titlebar/maximized_focus_active.png"
blackbox                        = theme.confdir .. "/icons/psoicons/blackbox.png"

theme.musicplr = string.format("%s -e ncmpcpp", awful.util.terminal)
local markup = lain.util.markup
local blue   = "#80CCE6"
local space3 = markup.font("Roboto 3", " ")



-- some widgets
local mytextclock = wibox.widget.textclock(markup("#fffede", "   %H:%M "))
--mytextclock.font = theme.font
mytextclock.font = 'Aakash 14'
local clock_icon = wibox.widget.imagebox(theme.clock)
--local clockbg = wibox.container.background(mytextclock, theme.bg_normal, gears.shape.rectangle)
local clockbg = wibox.container.background(mytextclock, borders_color, gears.shape.octogon)
local clockwidget = wibox.container.margin(clockbg, dpi(0), dpi(3), dpi(5), dpi(5))

local mytextclock2 = wibox.widget.textclock(markup.fontfg(theme.font, "#a6e2cc", "  %a. %d.%m.%y"))
local clockbg2 = wibox.container.background(mytextclock2, side_color, gears.shape.octogon)
local clockwidget2 = wibox.container.margin(clockbg2, dpi(10), dpi(10), dpi(5), dpi(5))
calbox =  wibox.container.background(clockwidget2, (borders_color), gears.shape.octogon ) -- clock & layoutbox with shape

-- Calendar
local mytextcalendar = wibox.widget.textclock(markup.fontfg(theme.font, "#FFFFFF", space3 .. "%d %b " .. markup.font("Roboto 5", " ")))
local calendar_icon = wibox.widget.imagebox(theme.calendar)
local calbg = wibox.container.background(mytextcalendar, theme.bg_focus, gears.shape.rectangle)
local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(0), dpi(5), dpi(5))
local calendarwidget2 = wibox.container.margin(calbg, dpi(0), dpi(-10), dpi(800), dpi(5))

theme.cal = lain.widget.cal({
    attach_to = { mytextclock2, mytextcalendar },
    notification_preset = {
        fg = "#FFFFFF",
        bg = theme.bg_normal,
        position = "top_right",
        font = "Monospace 10"
    }
})

-- MPD
local mpd_icon = awful.widget.launcher({ image = theme.mpdl, command = theme.musicplr })
local prev_icon = wibox.widget.imagebox(theme.prev)
local next_icon = wibox.widget.imagebox(theme.nex)
local stop_icon = wibox.widget.imagebox(theme.stop)
local pause_icon = wibox.widget.imagebox(theme.pause)
local play_pause_icon = wibox.widget.imagebox(theme.play)
theme.mpd = lain.widget.mpd({
    settings = function ()
        if mpd_now.state == "play" then
            mpd_now.artist = mpd_now.artist:upper():gsub("&.-;", string.lower)
            mpd_now.title = mpd_now.title:upper():gsub("&.-;", string.lower)
            widget:set_markup(markup.font("Roboto 4", " ")
                              .. markup.font(theme.mpd_font,
                              " " .. mpd_now.artist
                              .. " - " ..
                              mpd_now.title .. "  ") .. markup.font("Roboto 5", " "))
            play_pause_icon:set_image(theme.pause)
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font("Roboto 4", " ") ..
                              markup.font(theme.taglist_font, " ⏸  ") ..
                              markup.font("Roboto 5", " "))
            play_pause_icon:set_image(theme.play)
        else
            widget:set_markup("")
            play_pause_icon:set_image(theme.play)
        end
    end
})
local musicbg = wibox.container.background(theme.mpd.widget, (borders_color), gears.shape.octogon)
local musicwidget = wibox.container.margin(musicbg, dpi(0), dpi(0), dpi(5), dpi(5))
musicwidget:buttons(my_table.join(awful.button({ }, 1,
function () awful.spawn(theme.musicplr) end)))
prev_icon:buttons(my_table.join(awful.button({}, 1,
function ()
    os.execute("mpc prev")
    theme.mpd.update()
end)))
next_icon:buttons(my_table.join(awful.button({}, 1,
function ()
    os.execute("mpc next")
    theme.mpd.update()
end)))
stop_icon:buttons(my_table.join(awful.button({}, 1,
function ()
    play_pause_icon:set_image(theme.play)
    os.execute("mpc stop")
    theme.mpd.update()
end)))
play_pause_icon:buttons(my_table.join(awful.button({}, 1,
function ()
    os.execute("mpc toggle")
    theme.mpd.update()
end)))

-- Battery
local bat = lain.widget.bat({
    settings = function()
--        bat_header = " "
        bat_header = "☸ "
        bat_p      = bat_now.perc .. "%"
        if bat_now.ac_status == 1 then
            bat_p = bat_p .. ""
            bat_header = " "
	    widget:set_markup(markup.font(theme.mpd_font, markup("#ffffff", bat_header) .. bat_p))
        end
        widget:set_markup(markup.font(theme.mpd_font, markup(blue, bat_header) .. bat_p))
    end
})


-- ALSA volume bar
theme.volume = lain.widget.alsabar({
    notification_preset = { font = "Monospace 14"},
    --togglechannel = "IEC958,3",
    width = dpi(80), height = dpi(30), border_width = dpi(0),ticks = true, tick_size=5,
    colors = {
        --background = "#212121",
        background = side_color .. "22",
	unmute     = tag_color,
        mute       = "#FF9F9F"
    },

})
theme.volume.bar.paddings = dpi(5)
theme.volume.bar.margins = dpi(2)
theme.volume.bar:buttons(awful.util.table.join(
    awful.button({}, 3, function() -- left click
        awful.spawn(string.format("%s -e alsamixer", terminal))
    end),
    awful.button({}, 2, function() -- middle click
        awful.spawn(string.format("%s -e ncmpcpp", terminal))
    end),
    awful.button({}, 1, function() -- right click
        os.execute(string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
        theme.volume.update()
    end),
    awful.button({}, 4, function() -- scroll up
        os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
        theme.volume.update()
    end),
    awful.button({}, 5, function() -- scroll down
        os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
        theme.volume.update()
    end)
    ))
--local volumewidget = wibox.container.background(theme.volume.bar, theme.bg_normal, gears.shape.rectangle)
--volumewidget = wibox.container.background(theme.volume.bar, borders_color, gears.shape.rectangle)
volumewidget = wibox.container.background(theme.volume.bar, borders_color, gears.shape.hexagon)
volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(0), dpi(15), dpi(15))


-- for secondary monitors volume widget
local volumewidget_secondary = wibox.container.background(theme.volume.bar, theme.bg_normal, gears.shape.rectangle)
volumewidget_secondary = wibox.container.margin(volumewidget_secondary, dpi(0), dpi(0), dpi(0), dpi(0))



-- CPU
local cpu_icon = wibox.widget.imagebox(theme.cpu)
local cpu = lain.widget.cpu({
	settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", "💽 " ..  cpu_now.usage .. "%"))
	end
})
local cpubg = wibox.container.background(cpu.widget, theme.bg_normal, gears.shape.rectangle)
local cpuwidget = wibox.container.margin(cpubg, dpi(0), dpi(0), dpi(5), dpi(5))

-- Weather
theme.weather = lain.widget.weather({
--    city_id = 2643743, -- placeholder (London)
    city_id = 2660042, -- placeholder (Landquart)
    notification_preset = { font = "Inconsolata 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font2, "#fffedb", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#000000",  units .. "°C" .. " 🌤" ))
    end
})
weatherback = wibox.widget.background()
weatherback:set_widget(theme.weather.widget)
weatherback:set_bg(tag_color)  -- Green background
weatherback:set_fg("#000000")  -- White text

-- Separators
local first = wibox.widget.textbox('<span font="Roboto 7"> </span>')
local spr_small = wibox.widget.imagebox(theme.spr_small)
local spr_very_small = wibox.widget.imagebox(theme.spr_very_small)
local spr_right = wibox.widget.imagebox(theme.spr_right)
local spr_bottom_right = wibox.widget.imagebox(theme.spr_bottom_right)
local spr_side = wibox.widget.imagebox(theme.spr_side)
local spr_left = wibox.widget.imagebox(theme.spr_left)
local bar = wibox.widget.imagebox(theme.bar)
local gradbar = wibox.widget.imagebox(theme.gradbar)
local transbar = wibox.widget.imagebox(theme.transbar)
local transpace = wibox.widget.imagebox(theme.transpace)
local transquare = wibox.widget.imagebox(theme.transquare)
local bottom_bar = wibox.widget.imagebox(theme.bottom_bar)

--HOW TO MAKE A GRADIENT
local barcolor  = gears.color({
    type  = "linear",
    from  = { dpi(32), 0 },
    to    = { dpi(32), dpi(32) },
    stops = { {0, theme.bg_focus}, {0.25, "#595959"}, {1, theme.bg_focus} }
})

---- ANOTHER GRADIENT
--local barcolor2  = gears.color({
--  type = "radial",
-- -- from = { 5, 70, 40 },
-- -- to = { 90, 90, 30 },
--  from = { 0, 0, 0 },
--  to = { 0, 90, 0 },
--  stops = { { 70, "#ff0000" }, { 0.5, "#00ff00" }, { 1000, "#0000ff" } }
--
--})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all

-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end
  -- Tags
  --  awful.layout.layouts = {layouts[1],layouts[2],layouts[1],layouts[1],layouts[1],layouts[1]},
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    --s.mypromptbox = awful.widget.prompt()
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

-- {{   	SETTING TAG BEHAVIOUR
function set_tag_color1()
--side_color = "#001326" .. "60"
--screen[1].mysidewibox:set_bg(side_color)
borders_color = "#719901" .. "55"
tag_color = "#719901"
theme.border_focus                              = "#A7E28B" .. "05"
volumewidget:set_color(borders_color)
clockbg:set_bg(borders_color)
calbox:set_bg(borders_color)
mentobox:set_bg(borders_color)
musicbg:set_bg(borders_color)
weatherback:set_bg(tag_color)
end

function set_tag_color2()
tag_color = "#ACAA01"
borders_color = "#ACAA01" .. "55"
--theme.border_focus                              = "#D8E28B" .. "05"
theme.border_focus                              = "#D9574F" .. "45"
volumewidget:set_color(borders_color)
clockbg:set_bg(borders_color)
calbox:set_bg(borders_color)
mentobox:set_bg(borders_color)
musicbg:set_bg(borders_color)
weatherback:set_bg(tag_color)
end

function set_tag_color3()
tag_color = "#01AC8D"
borders_color = "#6AC8C0" .. "55"
--theme.border_focus                              = "#D8E28B" .. "05"
theme.border_focus                              = "#6D6D6D" .. "25"
volumewidget:set_color(borders_color)
clockbg:set_bg(borders_color)
calbox:set_bg(borders_color)
mentobox:set_bg(borders_color)
musicbg:set_bg(borders_color)
weatherback:set_bg(tag_color)
end

function set_tag_color4()
tag_color = "#414996"
borders_color = "#0038C6" .. "55"
theme.border_focus                              = "#8BB8E2" .. "05"
volumewidget:set_color(borders_color)
clockbg:set_bg(borders_color)
calbox:set_bg(borders_color)
mentobox:set_bg(borders_color)
musicbg:set_bg(borders_color)
weatherback:set_bg(tag_color)
end

function set_tag_color5()
tag_color = "#773737"
borders_color = "#C8030F" .. "55"
theme.border_focus                              = "#785050" .. "05"
volumewidget:set_color(borders_color)
clockbg:set_bg(borders_color)
calbox:set_bg(borders_color)
musicbg:set_bg(borders_color)
mentobox:set_bg(borders_color)
weatherback:set_bg(tag_color)
end
--
screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )
screen[1]:connect_signal("tag6", set_tag_color3 )
screen[1]:connect_signal("tag7", set_tag_color5 )
screen[1]:connect_signal("tag8", set_tag_color3 )
screen[1]:connect_signal("tag9", set_tag_color3 )

--screen[2]:connect_signal("tag1", set_tag_color1 )
--screen[2]:connect_signal("tag2", set_tag_color2 )
--screen[2]:connect_signal("tag3", set_tag_color3 )
--screen[2]:connect_signal("tag4", set_tag_color4 )
--screen[2]:connect_signal("tag5", set_tag_color5 )
--screen[2]:connect_signal("tag6", set_tag_color3 )
--screen[2]:connect_signal("tag7", set_tag_color5 )
--screen[2]:connect_signal("tag8", set_tag_color3 )
--screen[2]:connect_signal("tag9", set_tag_color3 )

-- }}

--additional widgets

uptimebox = wibox.container.margin(uptime_widget, dpi(1), dpi(1), dpi(5),dpi(5)) -- uptime box
logobox = wibox.container.margin(test_widget, dpi(25), dpi(25), dpi(5),dpi(15)) -- logo icon box (oot icons)
--coronaukholder = wibox.container.background(coronauk_widget, dpi(5), dpi(5), dpi(15),dpi(15), gears.shape.octagon) -- corona icon box
coronaukholder = wibox.container.background(coronauk_widget, (side_color), rect) -- corona icon box
coronaukbox = wibox.widget{{
	    left   = 0,
            right  = 0,
            top    = 40,
            bottom = 0,
            widget = wibox.container.margin
        },
coronaukholder,
layout = wibox.layout.fixed.vertical
}
-- should be layout for screen
mento = wibox.widget{
	clockwidget,
	s.mylayoutbox,
        layout = wibox.layout.fixed.horizontal,
}
--mentobox =  wibox.container.margin(mento, dpi(5), dpi(2), dpi(10),dpi(5), ("#6AC8C0" .. "55") ) -- clock & layoutbox
mentobox =  wibox.container.background( mento, (borders_color), gears.shape.octogon ) -- clock & layoutbox with shape
bentobox = wibox.widget{{
	    left   = 0,
            right  = 0,
            top    = 40,
            bottom = 0,
            widget = wibox.container.margin
        },
mentobox,
layout = wibox.layout.fixed.horizontal
}
mailbox = wibox.container.margin(email_widget, dpi(5), dpi(15), dpi(15),dpi(5)) -- email icon box
mailbox:buttons(awful.util.table.join( -- left click to spawn neomutt
		awful.button({ }, 1, function () awful.spawn("st -e neomutt")
		end)))
newsbox = wibox.container.margin(news_widget, dpi(2), dpi(2), dpi(15),dpi(2)) -- email icon box
newsbox:buttons(awful.util.table.join( -- left click to spawn newsboat
		awful.button({ }, 1, function () awful.spawn("st -e newsboat")
		end)))

newsandmail = wibox.widget{
mailbox,
winbox,
--newsbox,
layout = wibox.layout.fixed.horizontal,
}
winbox = wibox.container.margin(windowsvm, dpi(5), dpi(15), dpi(15),dpi(5)) -- windows icon box
winbox:buttons(awful.util.table.join( -- left click to spawn newsboat
		--awful.button({ }, 1, function () awful.spawn("virt-manager")
		awful.button({ }, 1, function () awful.spawn("/home/jon/.local/bin/utilities/vmtoggle")
		end)))
flowerbox = wibox.container.margin(waterflowers, dpi(2), dpi(2), dpi(15),dpi(2)) -- windows icon box
winflower = wibox.widget{
winbox,
flowerbox,
layout = wibox.layout.fixed.horizontal,
}


-- Create a taglist widget
s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, { bg_focus = barcolor })
  mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.powerline )
    s.mytag = wibox.container.margin(mytaglistcont, dpi(5), dpi(2), dpi(2),dpi(10))

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.rectangle, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center" })


function vertical_wibox(s)
-- specific rid of other wibar
if s.index == 1
then s.mysidewibox = awful.wibar ({ position = "right", screen = s, width = 110, x=0,y=0, bg = side_color,  border_width = dpi(0), height = s.workarea.height/1, type = "dock" }) -- without shape
-- Add widgets to the side wibox
s.mysidewibox:setup {
        layout = wibox.layout.align.vertical,
        { -- bottom widgets
            layout = wibox.layout.fixed.vertical,
            s.mytag,
--	  clockwidget2,
--	  transquare,
	   calbox,
        wibox.widget.systray(),
--	  clockwidget,
--	  transbar,
--  transquare,
	--redshift,
--  transquare,
--	  coronafull_widget,
-- 	  corona_widget,
-- 	  coronarecovered_widget,
	  coronaukbox,
	  transbar,
          transquare,
--	  s.mytasklist,
--        rates_widget,
--	  bat.widget,
--	  winflower,
	  newsandmail,
	  uptimebox, -- contains uptime_widget
--	  theme.weather.widget,
	  weatherback, -- weather background
--	  test_widget,
          volumewidget,
--          musicwidget,
--  transquare,
	wibox.container.background( wibox.widget {clockwidget,s.mylayoutbox,layout=wibox.layout.fixed.horizontal}, (side_color), gears.shape.octogon ), -- clock & layoutbox with shape
--	 logobox,
--          bentobox, -- clock & layoutbox with margin..
 --         wibox.widget.systray(),
        },
    }
end
end

-- Create the wibox
function horizontal_wibox(s)
-- specific rid of other wibar
if s.index == 2
then s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(25), bg = (side_color), fg = theme.fg_normal })
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
        s.mytaglist,
--	s.mylayoutbox,
--          bentobox, -- clock & layoutbox with margin..
        },
	{
	  layout = wibox.layout.fixed.horizontal,
        s.mytasklist,
	},
	{
	  layout = wibox.layout.fixed.horizontal,
          volumewidget_secondary,
	  bentobox,
	},

}
end
end

gears.timer.delayed_call(vertical_wibox, s)
gears.timer.delayed_call(horizontal_wibox, s)

end
return theme
