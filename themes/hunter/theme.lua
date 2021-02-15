--[[
	Hunter ver.
--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local theme_assets = require("beautiful.theme_assets")
local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/hunter"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/hunter/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/hunter/wall.png"
theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/themes/hunter"

------ personal widgets ----- {{

-- bars --
local redshift = require('extra.bars.redshift')
local ddcshift = require('extra.bars.ddcshift')
-- sliding bars --
local tagbar = require('extra.slidebars.tagbar')
local titlebar = require('extra.slidebars.titlebar')
-- indicator --
local email = require('extra.emailhunter')
local vm = require('extra.vmhunter')
local gpuhunter = require('extra.gpuhunter')
-- geographic environment widgets --
local airquality = require('extra.geographic.airquality')
local humidity = require('extra.geographic.humidity')
local temperature = require('extra.geographic.temperature')


--theme.font          = "sf mono 12"
--theme.taglist_font  = "sf mono 12"
--theme.mpd_font  = "sf mono 10"
--theme.tasklist_font = "sf mono 12"


theme.font          = "Iosevka 12"
theme.taglist_font  = "Iosevka 12"
theme.mpd_font  = "Open Sans 10"
--theme.tasklist_font = "Linux Biolinum 12"
theme.tasklist_font = "sf mono 13"
--theme.tasklist_font = "Iosevka 14"


theme.fg_normal                                 = "#bababa"
theme.fg_focus					= "#e33a6e"
--theme.bg_focus                                  = "#242424"
theme.bg_focus                                  = "#141c29" -- midnight blue
--theme.bg_focus = "#B6BD68"

theme.bg_normal                                 = "#141414"
theme.fg_urgent                                 = "#000000"
theme.bg_urgent                                 = "#D9574F"

--theme.fg_urgent                                 = "#CC9393"
--theme.bg_urgent                                 = "#006B8E"

theme.border_width                              = dpi(2)
theme.border_normal                             = "#252525"
--theme.border_focus                              = "#ADAFFF" .. "15"
theme.border_focus                              = "#c3c997" .. "15"


--taglist colors
theme.taglist_fg_focus = "#000000"
--theme.taglist_bg_empty = "#f5f5f6" -- light
--theme.taglist_bg_empty = "#c2c3c2" -- darker
theme.taglist_bg_empty = "#A5A5A6" -- evendarker
theme.taglist_fg_empty = "#000000"
theme.taglist_bg_occupied = "#6c8797"
theme.taglist_fg_occupied = "#000000"

--taglist colors
theme.taglist_fg_focus_base = "#000000"
--theme.taglist_bg_empty = "#f5f5f6" -- light
theme.taglist_bg_empty_base = "#c2c3c2" -- darker
theme.taglist_fg_empty_base = "#000000"
theme.taglist_bg_occupied_base = "#6c8797"
theme.taglist_fg_occupied_base = "#000000"

--theme.tasklist_bg_normal                        = "#222222"
theme.tasklist_bg_normal                        = "#141414"
--theme.tasklist_fg_focus                         = "#4CB7DB"
--theme.tasklist_fg_focus                         = "#b6deaf"
--theme.tasklist_fg_focus                         = "#e33a6e"
--theme.tasklist_fg_focus                         = "#c5c69a"
 --  theme.tasklist_fg_focus                         = "#ADAFFF" --Light purple
   theme.tasklist_fg_focus                         = "#F9A256" --Light Orange
--   theme.tasklist_fg_focus                         = "#000000" -- BLACK
--theme.tasklist_fg_focus                         = "#96d58b"
theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(160)
theme.menu_icon_size                            = dpi(32)
theme.awesome_icon                              = theme.icon_dir .. "/awesome_icon_white.png"
theme.awesome_icon_launcher                     = theme.icon_dir .. "/awesome_icon.png"
--theme.taglist_squares_sel                       = theme.icon_dir .. "/square_sel.png"
--theme.taglist_squares_unsel                     = theme.icon_dir .. "/square_unsel.png"
theme.taglist_squares_sel                       = theme.icon_dir .. "/icons/stopsel.png"
theme.taglist_squares_unsel                     = theme.icon_dir .. "/icons/stopsel2.png"
theme.spr_small                                 = theme.icon_dir .. "/spr_small.png"
theme.spr_very_small                            = theme.icon_dir .. "/spr_very_small.png"
theme.spr_right                                 = theme.icon_dir .. "/spr_right.png"
theme.spr_bottom_right                          = theme.icon_dir .. "/spr_bottom_right.png"
theme.spr_side                        		    = theme.icon_dir .. "/spr_side.png"
theme.spr_left                                  = theme.icon_dir .. "/spr_left.png"
theme.bar                                       = theme.icon_dir .. "/bar.png"
theme.bottom_bar                                = theme.icon_dir .. "/bottom_bar.png"
theme.mpdl                                      = theme.icon_dir .. "/mpd.png"
theme.mpd_on                                    = theme.icon_dir .. "/mpd_on.png"
theme.prev                                      = theme.icon_dir .. "/prev.png"
theme.nex                                       = theme.icon_dir .. "/next.png"
theme.stop                                      = theme.icon_dir .. "/stop.png"
theme.pause                                     = theme.icon_dir .. "/pause.png"
theme.play                                      = theme.icon_dir .. "/play.png"
theme.clock                                     = theme.icon_dir .. "/clock.png"
theme.calendar                                  = theme.icon_dir .. "/cal.png"
theme.cpu                                       = theme.icon_dir .. "/cpu.png"
theme.net_up                                    = theme.icon_dir .. "/net_up.png"
theme.net_down                                  = theme.icon_dir .. "/net_down.png"
--theme.layout_tile                               = theme.icon_dir .. "/tile.png"
    --theme.layout_tile                               = theme.confdir .. "/icons/masterslave.png"
    theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
    theme.layout_cascade                            = theme.confdir .. "/icons/magnifier.png"
    theme.layout_uselesstile                        = theme.confdir .. "/icons/centerwork.png"
    theme.layout_strutwide                        = theme.confdir .. "/icons/tile.png"
    theme.layout_strutcenter                        = theme.confdir .. "/icons/centerwork.png"
--theme.layout_tileleft                           = theme.icon_dir .. "/tileleft.png"
--theme.layout_tilebottom                         = theme.icon_dir .. "/tilebottom.png"
--theme.layout_tiletop                            = theme.icon_dir .. "/tiletop.png"
--theme.layout_fairv                              = theme.icon_dir .. "/fairv.png"
--theme.layout_fairh                              = theme.icon_dir .. "/fairh.png"
--theme.layout_spiral                             = theme.icon_dir .. "/spiral.png"
--theme.layout_dwindle                            = theme.icon_dir .. "/dwindle.png"
--theme.layout_max                                = theme.icon_dir .. "/max.png"
--theme.layout_fullscreen                         = theme.icon_dir .. "/fullscreen.png"
--theme.layout_magnifier                          = theme.icon_dir .. "/magnifier.png"
theme.layout_floating                           = theme.icon_dir .. "/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(45)
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

theme.musicplr = string.format("%s -e ncmpcpp", awful.util.terminal)

local markup = lain.util.markup
local blue   = "#80CCE6"
local space3 = markup.font("Roboto 3", " ")

-- Clock
local mytextclock = wibox.widget.textclock(markup("#000000", " %Y-%m-%d "))
mytextclock.font = theme.font
local clock_icon = wibox.widget.imagebox(theme.clock)
local clockbg = wibox.container.background(mytextclock, theme.taglist_bg_empty, gears.shape.rectangle)
local mytextclock2 = wibox.widget.textclock(markup("#000000", " %H:%M" ))
mytextclock2.font = theme.font
local clockbg2 = wibox.container.background(mytextclock2, theme.taglist_bg_empty, gears.shape.rectangle)
local clock_widget_text_icon1 = wibox.widget {
	text = " 📅 ",
	font = "Iosevka 12",
	widget = wibox.widget.textbox,
}
local clock_widget_icon1 = wibox.widget {
	clock_widget_text_icon1,
	--bg = "#E7D469",
	bg = "#c3c997",
	fg = "#000000",
	widget = wibox.container.background,
}
local clock_widget_text_icon2 = wibox.widget {
	text = " 🕗 ",
	font = "Iosevka 12",
	widget = wibox.widget.textbox,
}
local clock_widget_icon2 = wibox.widget {
	clock_widget_text_icon2,
	--bg = "#05C6E2", -- bright overbearing blue
	bg = "#97c3c9",
	fg = "#000000",
	widget = wibox.container.background,
}
local full_clock_widget = wibox.widget {
	clock_widget_icon1,
	clockbg,
	clock_widget_icon2,
	clockbg2,
	layout = wibox.layout.fixed.horizontal,
}
local clockwidget = wibox.container.margin(full_clock_widget, dpi(0), dpi(0), dpi(5), dpi(5))

local mytextclock2 = wibox.widget.textclock(markup("#fffede", "📅 %d.%m.%y"))
local clockbg2 = wibox.container.background(mytextclock2, theme.taglist_bg_empty, gears.shape.rectangle)
local clockwidget2 = wibox.container.margin(clockbg2, dpi(0), dpi(0), dpi(5), dpi(5))

-- Calendar
local mytextcalendar = wibox.widget.textclock(markup.fontfg(theme.font, "#FFFFFF", space3 .. "%d %b " .. markup.font("Roboto 5", " ")))
local calendar_icon = wibox.widget.imagebox(theme.calendar)
local calbg = wibox.container.background(mytextcalendar, theme.bg_focus, gears.shape.rectangle)
local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(0), dpi(5), dpi(5))
local calendarwidget2 = wibox.container.margin(calbg, dpi(0), dpi(-10), dpi(800), dpi(5))
theme.cal = lain.widget.cal({
    attach_to = { mytextclock, mytextcalendar },
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
local musicbg = wibox.container.background(theme.mpd.widget, theme.bg_focus, gears.shape.hexagon)
local musicwidget = wibox.container.margin(musicbg, dpi(0), dpi(0), dpi(5), dpi(5))
local musicwidget2 = wibox.container.margin(musicbg, dpi(-10), dpi(0), dpi(5), dpi(5))

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
        bat_header = " Bat "
        bat_p      = bat_now.perc .. " "
        if bat_now.ac_status == 1 then
            bat_p = bat_p .. "Plugged "
        end
        widget:set_markup(markup.font(theme.font, markup(blue, bat_header) .. bat_p))
    end
})


-- ALSA volume bar
theme.volume = lain.widget.alsabar({
    notification_preset = { font = "Monospace 14"},
    --togglechannel = "IEC958,3",
    --width = dpi(80), height = dpi(50), border_width = dpi(0),ticks = false, tick_size=3, -- 1080p monitor divisions
    width = dpi(100), height = dpi(50), border_width = dpi(0),ticks = false, tick_size=3,
    colors = {
        --background = "#383838",
        --background = "#C2C3C2",
        --background = "#A5A5A6",
        --background = "#ABB1DD",
        background = "#343434",
        --unmute     = "#80CCE6",
        --unmute     = "#465DFF",
        --unmute     = "#8c9aff",
        unmute     = "#7289DA",
        mute       = "#FF9F9F"
    },
})
theme.volume.bar.paddings = dpi(0)
theme.volume.bar.margins = dpi(8)
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

local volumewidget = wibox.container.background(theme.volume.bar, theme.bg_focus, gears.shape.rectangle)
volumewidget = wibox.container.margin(volumewidget, dpi(3), dpi(3), dpi(10), dpi(10))

-- CPU
local cpu = lain.widget.cpu({
	settings = function()
        widget:set_markup(markup.fontbg(theme.font, "#A5A5A6", cpu_now.usage .. "% "))
	end
})

local cpu_widget_icon = wibox.widget {
	--text = " 💽 ",
	text = "    ",
	font = "Iosevka 10",
	widget = wibox.widget.textbox,
}
local cpu_widget_icon_handle = wibox.widget {
	cpu_widget_icon,
	--bg = "#02Ad9B", -- deep green
	--bg = "#93C8b0", -- pale green
	--bg = "#7289da", -- nice violet
	--bg = "#88aadd", -- yellowish
	bg = "#7289DA", -- yellowish
	fg = "#000000",
	widget = wibox.container.background,
}
local cpu_bg_handle = wibox.widget {
	cpu,
    bg = "#A5A5A6",
	fg = "#000000",
	widget = wibox.container.background,
}
local full_cpu_widget = wibox.widget {
	cpu_widget_icon_handle,
    cpu_bg_handle,
	layout = wibox.layout.fixed.horizontal,
}
local cpuwidget = wibox.container.margin(full_cpu_widget, dpi(0), dpi(0), dpi(5), dpi(5))

-- Net
local netdown_icon = wibox.widget.imagebox(theme.net_down)
local netup_icon = wibox.widget.imagebox(theme.net_up)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font("Roboto 1", " ") .. markup.font(theme.font, net_now.received .. " - "
                          .. net_now.sent) .. markup.font("Roboto 2", " "))
    end
})
local netbg = wibox.container.background(net.widget, theme.bg_focus, gears.shape.rectangle)
local networkwidget = wibox.container.margin(netbg, dpi(0), dpi(0), dpi(5), dpi(5))


-- Weather
theme.weather = lain.widget.weather({
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = "Inconsolata 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font2, "#fffedb", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
--        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. "🌤 @ " .. units .. "°C "))
--        widget:set_markup(markup.fontfg(theme.font, "#fffedb", "🌤" .. units .. "°C   "))
        widget:set_markup(markup.fontfg(theme.font, "#fffedb",  units .. "°C" .. " 🌤" ))
    end
})


-- Launcher
local mylauncher = awful.widget.button({ image = theme.awesome_icon_launcher })
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

-- Separators
local spr_small = wibox.widget.imagebox(theme.spr_small)
local spr_very_small = wibox.widget.imagebox(theme.spr_very_small)
local spr_right = wibox.widget.imagebox(theme.spr_right)
local spr_bottom_right = wibox.widget.imagebox(theme.spr_bottom_right)
local spr_side = wibox.widget.imagebox(theme.spr_side)
local spr_left = wibox.widget.imagebox(theme.spr_left)
local bar = wibox.widget.imagebox(theme.bar)
local bottom_bar = wibox.widget.imagebox(theme.bottom_bar)

local barcolor  = gears.color({
    type  = "linear",
    from  = { dpi(32), 0 },
    to    = { dpi(32), dpi(32) },
    stops = { {0, theme.bg_focus}, {0.25, "#505050"}, {1, theme.bg_focus} }
})

--local titlebarcolor  = gears.color({
--    type  = "linear",
--    from  = { 0, 0 },
--    to    = { 0, 120 },
--    stops = { {0, "#000000"}, {0.9, "#505050" .. "00"}}
--})
local titlebarcolor = gears.color({
    type = "radial",
    from = { 200, 30, 120 },
    to = { 2500, 80, 140 },
    stops = { { 0, "#000000" .. "50" }, { 0.9, "#c2c3c2" .. "4" }, { 0.75, "#000000"}}
  })


local tagbarcolor  = gears.color({
    type  = "linear",
    from  = { 0, 120 },
    to    = { 0, 0 },
    stops = { {0, "#000000"}, {0.9, "#141c29" .. "98"}} -- grey
--    stops = { {0, "#000000"}, {0.9, "#505050" .. "95"}} -- grey
--    stops = { {0, "#000000"}, {0.9, "#4E78A3" .. "75"}} -- blueish (light)
})

--local tagbarbutton = gears.color({
--  type = "radial",
--  from = { 30, 30, 30 },
--  to = { 40, 30, 5 },
--  stops = { { 1, "#B2BECD" .. "30" }, { 0.2, "#B2BECD" .. "20" }}
--})
local tagbarbutton  = gears.color({
    type  = "linear",
    from  = { 0, 120 },
    to    = { 0, 0 },
    stops = { {0, "#4e78a3"}, {0.9, "#9e9e9e" .. "35"}}
})

local tagbarselcolor  = gears.color({
    type  = "linear",
    from  = { 0, 120 },
    to    = { 0, 0 },
    --stops = { {0.9, "#b6Bd68" .. "80"}, {0, "#505050" .. "85"}} -- Green?
    stops = { {0.9, "#f9a256" .. "80"}, {0, "#f9a256" .. "25"}}

})

local silverbar  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
--    stops = {{0.3, "#8E8E8E"}, {0.65, "#BBBBBB"}} -- Light (top dark)
--    stops = {{0.3, "#bbbbbb"}, {0.65, "#6b6b6b"}} -- A bit darker (bottom dark)
    stops = {{5.9, "#828282" }, {0.1, "#bbbbbb" }} -- a bit darker (bottom dark)
})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)



---- Eminent-like task filtering
--local orig_filter = awful.widget.taglist.filter.all
---- Taglist label functions
--awful.widget.taglist.filter.all = function (t, args)
--    if t.selected or #t:clients() > 0 then
--        return orig_filter(t, args)
--    end
--end

-- System Tray
--systrayholder = wibox.container.margin(wibox.widget.systray0 dpi(16), dpi(16), dpi(7),dpi(7)) -- sytstray
mysystray = wibox.widget.systray()
mysystray.visible = false
systraybg = wibox.container.background(mysystray, "#ff0000", gears.shape.rectangle)
systrayholder = wibox.container.margin(systraybg, dpi(5), dpi(5), dpi(7),dpi(7)) -- sytstray
systrayholder:connect_signal("mouse::enter", function() show_systray() end)
systrayholder:connect_signal("mouse::leave", function() hide_systray() end)
function show_systray() mysystray.visible = true end
function hide_systray() mysystray.visible = false end


-- EMAIL
emailholder = wibox.container.margin(email, dpi(10), dpi(0), dpi(5),dpi(5)) -- email

-- Computer stats Widgets --------------{{
-- WINDOWS VM identifier.
vmholder = wibox.container.margin(vm, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- GPU HOLDER
gpuholder = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm

-- Physical Environment Widgets-------- {{
-- temperature holder
temperatureholder = wibox.container.margin(temperature, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- humidity holder
humidityholder = wibox.container.margin(humidity, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- Air quality holder
airqualityholder = wibox.container.margin(airquality, dpi(0), dpi(10), dpi(5),dpi(5)) -- c893c5 vm

---------------------------------------}}}}


local bluelingrad = gears.color({
	type = "linear",
	from = { dpi(12), 0},
	--to   = { dpi(52), 20},
	--to   = { dpi(152), 20},
	to   = { dpi(182), 20},
--	stops = { {0.1, "#FF1b4d" .. "50"}, {0.45, "#FF000C" .. "75"} } -- was 0.55 before too
	stops = { {0.15, "#FF1b4d" .. "100"}, {0.75, "#0083ff" .. "75"} }
})

local redshiftbg  = gears.color({
    type  = "linear",
    from  = { dpi(32), 0 },
    to    = { dpi(32), dpi(32) },
    stops = { {0, theme.bg_focus}, {0.25, "#ff0000" .. "20"}}
})

local brightgrad = gears.color({
	type = "linear",
	from = { dpi(12), 0},
	to   = { dpi(52), dpi(22)},
	stops = { {0.1, "#FFFFFF" .. "50"}, {3.45, "#bdbdbd" .. "60"} }
})

-- DDCshift Bar
local ddcshiftholder = wibox.container.margin(ddcshift({ main_color = "#A5A5A6", background_color = "#343434", margins=8, shape = 'hexagon',}), dpi(5), dpi(5), dpi(8), dpi(8)) -- 1080p
local ddcshiftholder_3k = wibox.container.background(ddcshift({ main_color = "#A5A5A6", background_color = "#343434", margins=10, shape = 'hexagon',}), theme.bg_focus, gears.shape.rectangle) --background
ddcshiftholder_3k = wibox.container.margin(ddcshiftholder_3k, dpi(3), dpi(3), dpi(9), dpi(9)) -- margin
-- Redshift Bar
local redshiftholder = wibox.container.margin(redshift({ main_color = bluelingrad, background_color = "#343434", margins=8, shape = 'hexagon',}), dpi(5), dpi(5), dpi(8), dpi(8)) -- 1080p
local redshiftholder_3k = wibox.container.background(redshift({ main_color = bluelingrad, background_color = "#343434", margins=10, shape = 'hexagon',}), theme.bg_focus, gears.shape.rectangle) --background
redshiftholder_3k = wibox.container.margin(redshiftholder_3k, dpi(3), dpi(2), dpi(9), dpi(9)) -- margin

-- shapes
-- hexagon nicely squeezed
local goodhexa = function(cr, width, height)
--    gears.shape.hexagon(cr, 50, 50)
--    gears.shape.transform(gears.shape.hexagon) : translate(0,5)(cr,70,50)
    gears.shape.transform(gears.shape.hexagon) : rotate_at(35,24,math.pi)(cr,70,47)


--    goodhexa.transform(shape.hexagon) : translate(0,15)(cr,70,20)
end
local realagon = function(cr, width, height)
    local temp = 0
    if width > height then temp = height else temp = width end
    cr:move_to(temp/2,0)
    cr:line_to(temp/temp * 3/11)
    cr:line_to(temp/temp * 8/11)
    cr:line_to(temp/2,temp)
    cr:line_to(0,temp * 8/11)
    cr:line_to(0,temp * 3/11)
    cr:close_path()
end


  -- Tags
  --  awful.layout.layouts = {layouts[1],layouts[2],layouts[1],layouts[1],layouts[1],layouts[1]},
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)
--    awful.tag(awful.util.icons, s, awful.layout.layouts)
--    awful.tag(awful.util.tagnames2, s, awful.layout.layouts)


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

    layoutboxcontainer = wibox.container.margin(s.mylayoutbox, dpi(10), dpi(10), dpi(10), dpi(10))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, {
         bg_focus = "#B6BD68" ,
          font = "Iosevka 14",
          icons = {
                 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png",
                 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png",
                 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png",
                 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png"
               }
        })
    mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.rectangle)
    s.mytag = wibox.container.margin(mytaglistcont, dpi(1), dpi(1), dpi(2), dpi(2))

-- on tag change
--screen[1]:connect_signal("tag::history::update", function() -- if only desired on screen1..
----    tag.connect_signal(
----        "property::selected", function(t)
----   --     local s = t.screen or awful.screen.focused()
	--awesome.emit_signal (
        --"tagin", function()
      --end)
--end)

-- TAGBAR TAGLIST
    s.mytaglist3 = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
         bg_empty = theme.taglist_bg_empty_base .. "00",
         fg_empty = "#c2c3c2" .. "80",
        bg_occupied = tagbarbutton,

         fg_focus = "#c2c3c2" .. "80",
         fg_occupied = "#c2c3c2" .. "80",
        bg_focus = tagbarselcolor,
        --shape = gears.shape.rounded_rect
        --shape = gears.shape.hexagon
        --shape = goodhexa
        shape = goodhexa
    },
    layout   = {
        spacing = 30,
        spacing_widget = {
            color  = '#dddddd' .. "00",
            bg  = '#ff0000' .. "00",
            shape  = gears.shape.hexagon,
            widget = wibox.widget.separator,
        },
        layout  = wibox.layout.fixed.horizontal
    },

       widget_template = {
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
                    fg = '#dddddd' ..'50',
            --        bg     = '#dddddd',
            --       shape  = gears.shape.circle,
                    widget = wibox.container.background,
                },
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 3,
                    widget  = wibox.container.margin,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 25,
            right = 25,
            widget = wibox.container.margin
        },

        id     = 'background_role',
        widget = wibox.container.background,
        -- Add support for hover colors and an index label
        create_callback = function(self, c3, index, objects) --luacheck: no unused args
            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
            self:connect_signal('mouse::enter', function()
                if self.bg ~= '#ff0000' .. "20" then
                    self.backup     = self.bg
                    self.has_backup = true
                end
                self.bg = '#ff0000' .. "40"
            end)
            self:connect_signal('mouse::leave', function()
                if self.has_backup then self.bg = self.backup end
            end)
        end,
        update_callback = function(self, c3, index, objects) --luacheck: no unused args
            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
        end,
    },



   -- widget_template = {
   --     {
   --         {
   --             {
   --                 {
   --                     {
   --                         id     = 'index_role',
   --                         widget = wibox.widget.textbox,
   --                     },
   --                     margins = 3,
   --                     widget  = wibox.container.margin,
   --                 },
   --                 bg     = '#dddddd' .. "00",
   --                 fg     = '#dddddd' .. "00",
   --                 shape  = gears.shape.circle,
   --                 widget = wibox.container.background,
   --             },
   --             {   {
   --                    font = "iosevka 5",
   --                    text     = ' ',
   --                    widget = wibox.widget.textbox,
   --                 },
   --                 {
   --                    font = "iosevka 5",
   --                    text     = ' ',
   --                    widget = wibox.widget.textbox,
   --                 },
   --                 {
   --                     {
   --                      --  font = "iosevka 5",
   --                      --  id     = 'text_role', -- contains the actual text names of the tags
   --                      --   widget = wibox.widget.textbox,
   --                        id     = 'icon_role', -- contains the actual text names of the tags
   --                        widget = wibox.widget.imagebox,
   --                    },
   --                       layout = wibox.layout.align.horizontal,
   --                 },
   --                 layout = wibox.layout.align.vertical,
   --             },
   --             layout = wibox.layout.fixed.horizontal,
   --         },
   --         left  = 18,
   --         right = 18,
   --         widget = wibox.container.margin
   --     },
   --     id     = 'background_role',
   --     widget = wibox.container.background,
   --     -- Add support for hover colors and an index label
   --     create_callback = function(self, c3, index, objects) --luacheck: no unused args
   --         self:get_children_by_id('index_role')[1].markup = '<b> '..c3.index..' </b>'
   --         self:connect_signal('mouse::enter', function()
   --             if self.bg ~= '#ff0000' .. "20" then
   --                 self.backup     = self.bg
   --                 self.has_backup = true
   --             end
   --             self.bg = '#ff0000' .. "40"
   --         end)
   --         self:connect_signal('mouse::leave', function()
   --             if self.has_backup then self.bg = self.backup end
   --         end)
   --     end,
   --     update_callback = function(self, c3, index, objects) --luacheck: no unused args
   --         self:get_children_by_id('index_role')[1].markup = '<b> '..c3.index..' </b>'
   --     end,
   -- },
    buttons = awful.util.taglist_buttons
}



    local mytaglistcont2 = wibox.container.background(s.mytaglist3, "#ffffff" .. "00", gears.shape.hexagon)
    s.mytag2 = wibox.container.margin(mytaglistcont2, dpi(15), dpi(15), dpi(15), dpi(10))

    -- Create a tasklist widget
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.hexagon, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center" })
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = silverbar, shape = gears.shape.rectangle, align = "center" })
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.rectangle, align = "center" })


    s.titletasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, {
         bg_focus = "#121212" .. "00",
         fg_focus = "#ffffff",
         --font     = "Linux Biolinum 15",
         font     = "Iosevka 13",
         shape = gears.shape.rectangle,
         align = "center" })
    s.tasklistholder = wibox.container.margin(s.titletasklist, dpi(650), dpi(24), dpi(20), dpi(10))

   --s.myleftwibox = wibox({screen = s, x=s.workarea.width, y =s.workarea.height, width = dpi(6), height = s.workarea.height, fg = theme.fg_normal, bg = theme.bg_normal, position = "top", ontop = true, visible = true, type = "dock" })
--   s.myleftwibox = wibox({screen = s, x=1240, y=s.workarea.height, width = s.workarea.width, height = dpi(32), fg = theme.fg_normal, bg = theme.bg_normal, ontop = true, visible = true, type = "dock" })


-- Create the main taskbar wibox.
screen[1].mywibox = awful.wibar(
   -- screen[1].mywibox = wibox(
        {
        --position = "top",
         screen = s,
         height = dpi(32),
--         height = 50,
         --height = 40,
         width = s.workarea.width,
         --width = s.workarea.width - 50,
         --type = "dock",
  --       type = "bar",
--         y = 1440,
--         x = 900,
        --ontop = true,
        visible = true,
--         shape = gears.shape.rectangle
        }
    )
--    s.myleftwibox = awful.wibar({ position = "top", screen = s, height = dpi(32), })
-- Add widgets to the wibox
    screen[1].mywibox:setup {
   -- s.myleftwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytag,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
        musicwidget,
	    ddcshiftholder_3k,
	    redshiftholder_3k,
        volumewidget,
 --       vmholder, --  currently not using any vms
        temperatureholder,
        humidityholder,
        airqualityholder,
        gpuholder,
        cpuwidget,
	    emailholder,
    --    spr_small,
	    clockwidget,
        s.mylayoutbox,
        systrayholder,
        },
    }
-- if main screen then indent topbar down.
    if s.index == 1
    then
         screen[1].mywibox.height = dpi(38)
         --screen[1].mywibox.width = s.workarea.width - 50
         --screen[1].mywibox.y = 10
         --screen[1].mywibox:struts({left=0, right=0, top=45, bottom=0})
    end

function tagbar_hor(s)
	if s.index == 1
		then screen[1].mytagbar = tagbar {
--		screen[1].mytagbar = tagbar {
     --bg = "#282a36" .. "20",
     bg = tagbarcolor,
     screen = s,
     position = "bottom",
     --size = 60,
     size = 80,
     ontop = true,
    -- size_activator = 5,
    -- show_delay = 0.25,
     hide_delay = 0.2,
     easing = 5,
     delta = 90,
}
 screen[1].mytagbar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytag2,
--            s.mypromptbox,
        },
--        s.mytasklist, -- Middle widget
        { -- Right widgets
           layout = wibox.layout.fixed.horizontal,
--            mykeyboardlayout,
--            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end
end


----------- TITLEBAR DROPDOWN  -----------------------------------------------------
--function titlebar_hor(s)
--	if s.index == 1
--		then screen[1].mytitlebar = titlebar {
----		screen[1].mytitlebar = titlebar {
--     --bg = "#121212" .. "5",
--     bg = titlebarcolor,
--     screen = s,
--     position = "top",
--     --size = 60,
--     --size = 45,
--     --size = 45, -- just the topbar
--     size = 65,
--     ontop = true,
--    -- size_activator = 5,
----     show_delay = 0.2,
--     hide_delay = 0.1,
--     easing = 70,
--     delta = 20,
--  --   screen = nil
--}
-- screen[1].mytitlebar:setup {
--        layout = wibox.layout.align.horizontal,
--        { -- Left widgets
--            layout = wibox.layout.fixed.horizontal,
--        --s.titletasklist, -- Middle widget
--        s.tasklistholder, -- Middle widget
--        },
--        { -- Right widgets
--           layout = wibox.layout.fixed.horizontal,
--        },
--    }
--end
--end
--------------------------------------------------------------------------------------

-------------- VOLUME NOTIFICATION UPON CHANGE CENTER SCREEN -------------------------
--local volumebox = wibox({
--    x =  1100,
--    y = 1000,
--    width = 200,
--    height = 100,
--    ontop = true,
--    visible = false,
--    --screen = awful.screen.focused(),
--    screen = 1,
--    widget = volumewidget
--    }
--)
--local function invis_vol()
--   volumebox.visible = false
--end
--awesome.connect_signal("volumeup", function()
-- volumebox.visible = true
-- gears.timer.start_new(3, invis_vol)
--end)
--awesome.connect_signal("volumedown", function()
-- volumebox.visible = true
-- gears.timer.start_new(3, invis_vol)
--end)
------------------------------------------------------------------------------------

-------------- REDSHIFT NOTIFICATION UPON CHANGE CENTER SCREEN -------------------------
--local redshifterbox = wibox({
--    x =  1100,
--    y = 1000,
--    width = 340,
--    height = 100,
--    ontop = true,
--    visible = false,
--    --screen = awful.screen.focused(),
--    screen = 1,
--    widget = redshiftholder
--    }
--)
--local function invis_redshift()
--   redshifterbox.visible = false
--end
--awesome.connect_signal("redshiftup", function()
-- invis_vol()
-- redshifterbox.visible = true
-- gears.timer.start_new(3, invis_redshift)
--end)
------------------------------------------------------------------------------------


gears.timer.delayed_call(tagbar_hor, s)
--gears.timer.delayed_call(titlebar_hor, s)

end
return theme
