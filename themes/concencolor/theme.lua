--[[
	Concencolor (google inspired)
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
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/concencolor"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/concencolor/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/concencolor/wall.png"
theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/themes/concencolor"

------ personal widgets ----- {{
-- bars --
local redshift = require('extra.bars.redshift')
local ddcshift = require('extra.bars.ddcshift')
-- sliding bars --
local tagbar = require('extra.slidebars.tagbar')
local upper_titlebar = require('extra.slidebars.titlebar')
-- indicator --
local email = require('themes.concencolor.extra.email')
local vm = require('extra.vmhunter')
local gpuhunter = require('themes.concencolor.extra.gpuhunter')
local gputemps = require('themes.concencolor.extra.gputemps')
-- geographic environment widgets --
local airquality = require('extra.geographic.airquality')
local humidity = require('extra.geographic.humidity')
local temperature = require('extra.geographic.temperature')


--theme.font          = "sf mono 12"
--theme.taglist_font  = "sf mono 14"
--theme.mpd_font  = "sf mono 10"
--theme.tasklist_font = "sf mono 12"

theme.font          = "Iosevka 12"
theme.widget_font          = "Iosevka 13"
theme.calfont          = "Iosevka 14"
theme.taglist_font  = "Iosevka 12"
--theme.taglist_font  = "Linux Biolinum 18"
theme.mpd_font  = "Open Sans 10"
--theme.tasklist_font = "Linux Biolinum 12"
theme.tasklist_font = "sf mono 12"
--theme.tasklist_font = "Iosevka 14"
--theme.highlight = "#A3C784" -- google green
theme.highlight = "#88A67D" -- google green
theme.green = "#c2e1a1" -- google green
theme.red = "#EEA2A2" -- google red
theme.purp = "#A8A3EE" -- google purp
theme.yellow = "#F4E8a8" -- google teal
theme.blue = "#9ECDD2" -- google blue
--theme.highlight = "#b6bfd5" -- google blueish
--theme.highlight = "#9ECDD2" -- blueish



theme.email_alert = "#6FFFCB"
theme.fg_normal                                 = "#bababa"
theme.fg_focus					= "#e33a6e"
--theme.bg_focus                                  = "#242424"
theme.bg_focus                                  = "#141c29" -- midnight blue
--theme.bg_focus                                  = "#93c5c8" -- bright  blue
--theme.bg_focus                                  = "#7289DA" -- ephemeral blue
--theme.bg_focus = "#B6BD68"

theme.bg_normal                                 = "#141414" .. "99"
theme.fg_urgent                                 = "#000000"
theme.bg_urgent                                 = "#D9574F"
--theme.bg_urgent                                 = "#B57582"

--theme.fg_urgent                                 = "#CC9393"
--theme.bg_urgent                                 = "#006B8E"

--theme.border_width                              = dpi(2) -- normal
theme.border_width                              = 0 -- with smart_borders ((watchout with strutwide.lua [c.border_width]))
theme.border_normal                             = "#252525" .. "0"
--theme.border_focus                              = "#ADAFFF" .. "15"
--theme.border_focus                              = "#c3c997" .. "15"
theme.border_focus                              = "#7289DA" .. "0"
--theme.border_focus                              = "#9fb0a6"

-- widget value colors
--theme.widget_value_bg = "#A5A5A6" -- greyish
--theme.widget_value_bg = "#A5A5A6"
theme.widget_value_bg = "#A5A5A6" .. "0"
widget_value_bg = "#A5A5A6"
theme.my_color = "#ff0000"

--taglist colors
theme.taglist_fg_focus = "#000000"
--theme.taglist_bg_empty = "#f5f5f6" -- light
theme.taglist_bg_empty = "#c2c3c2" .. "20" -- darker
--theme.taglist_bg_empty = "#A5A5A6" -- evendarker
theme.taglist_fg_empty = "#000000"
theme.taglist_bg_occupied = "#6c8797" .. "65"
--theme.taglist_fg_occupied = "#000000"
theme.taglist_fg_occupied = "#c3c2c3"

--taglist colors
theme.taglist_fg_focus_base = "#000000"
--theme.taglist_bg_empty = "#f5f5f6" -- light
theme.taglist_bg_empty_base = "#c2c3c2" -- darker
theme.taglist_fg_empty_base = "#000000"
theme.taglist_bg_occupied_base = "#6c8797"
theme.taglist_fg_occupied_base = "#000000"

--theme.tasklist_bg_normal                        = "#141414"
theme.tasklist_bg_normal                        = "#282E2A"
-- theme.tasklist_fg_focus                         = "#ADAFFF" --Light purple
 --  theme.tasklist_fg_focus                         = "#F9A256" --Light Orange
 --  theme.tasklist_bg_focus                        = "#7289da"
--   theme.tasklist_bg_focus                          = "#141c29" -- midnight blue
--   theme.tasklist_bg_focus                          = googlegreen
   theme.tasklist_bg_focus                          = "#668371" -- google green
--   theme.tasklist_fg_focus                         = "#FFFFFF" -- WHITE
   theme.tasklist_fg_focus                         = "#000000" -- BLACK
--theme.tasklist_fg_focus                         = "#96d58b"

-- Tag Preview

theme.tag_preview_widget_border_radius = 0
theme.tag_preview_client_border_radius = 0
theme.tag_preview_client_opacity = 0.95
theme.tag_preview_client_bg =  "#000000"
theme.tag_preview_client_border_color = "#121212"
theme.tag_preview_client_border_width = 1           -- The border width of each client
theme.tag_preview_widget_bg = "#ff0002"
theme.tag_preview_widget_border_color = "#ffffff"   -- The border color of the widget
theme.tag_preview_widget_border_width = 0.2
theme.tag_preview_widget_margin = 0

theme.fade_duration = 250


theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(160)
theme.menu_icon_size                            = dpi(32)
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
theme.panelbg                                     = theme.icon_dir .. "/panel.png"
theme.tagbarbg                                     = theme.icon_dir .. "/tagbar.png"
theme.calendar                                  = theme.icon_dir .. "/cal.png"
theme.cpu                                       = theme.icon_dir .. "/cpu.png"
theme.net_up                                    = theme.icon_dir .. "/net_up.png"
theme.net_down                                  = theme.icon_dir .. "/net_down.png"
theme.layout_tile                               = theme.confdir .. "/icons/monomate.png"
theme.layout_cascade                            = theme.confdir .. "/icons/magnifier.png"
theme.layout_uselesstile                        = theme.confdir .. "/icons/centerwork.png"
theme.layout_strutwide                        = theme.confdir .. "/icons/tile.png"
theme.layout_strutcenter                        = theme.confdir .. "/icons/centerwork.png"
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



awful.rules.rules = {
	{ rule_any = { type = {"dialog", "normal" } },
	properties = { titlebars_enabled = true } },
}


theme.musicplr = string.format("%s -e ncmpcpp", awful.util.terminal)

local markup = lain.util.markup
local blue   = "#80CCE6"
local space3 = markup.font("Roboto 3", " ")

-- Clock
--local mytextclock = wibox.widget.textclock(markup("#c3c2c3", " %Y-%m-%d "))
local mytextclock = wibox.widget.textclock(markup("#c3c2c3", "%a, %d. %b "))
mytextclock.font = theme.calfont
local clock_icon = wibox.widget.imagebox(theme.clock)
local clockbg = wibox.container.background(mytextclock, theme.widget_value_bg, gears.shape.rectangle)
local mytextclock2 = wibox.widget.textclock(markup("#c3c2c3", " %H:%M" ))
mytextclock2.font = theme.calfont
local clockbg2 = wibox.container.background(mytextclock2, theme.widget_value_bg, gears.shape.rectangle)
local clock_widget_text_icon1 = wibox.widget {
	text = " 📅 ",
	font = "Iosevka 12",
	widget = wibox.widget.textbox,
}
local clock_widget_icon1 = wibox.widget {
	clock_widget_text_icon1,
	fg = "#c3c2c3",
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
	--bg = "#97c3c9",
	--bg = "#a7c3be",
	fg = "#c3c2c3",
	widget = wibox.container.background,
}
local full_clock_widget = wibox.widget {
--	clock_widget_icon1, -- calendar icon
	clockbg, -- calendar
--	clock_widget_icon2, -- clock icon
	clockbg2, -- clock
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
        position = "top_middle",
        font = "Iosevka 14"
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
    --width = dpi(100), height = dpi(50), border_width = dpi(0),ticks = false, tick_size=3,
    width = dpi(150), height = dpi(1), border_width = dpi(0),ticks = false, tick_size=3, -- max width for all bars is equiv to this width.
    colors = {
        background = "#343434",
        unmute     = "#7289DA",
        mute       = "#FF9F9F"
    },
})
theme.volume.bar.paddings = dpi(1)
theme.volume.bar.margins = dpi(1)
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
volumewidget = wibox.container.margin(volumewidget, dpi(3), dpi(3), dpi(12), dpi(12))

-- CPU
local cpu = lain.widget.cpu({
	settings = function()
        widget:set_markup(markup.font(theme.widget_font, "  " .. cpu_now.usage .. "% "))
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
	--bg = "#52677a", -- lighter blueish
	--bg = "#52677a", -- purp
	bg = "#7d88a6", -- purp
	fg = "#000000",
	widget = wibox.container.background,
}
local cpu_bg_handle = wibox.widget {
	cpu,
 --   bg = "#A5A5A6",
	--fg = "#000000",
	fg = "#7d88a6", -- purp
	widget = wibox.container.background,
}
local full_cpu_widget = wibox.widget {
	--cpu_widget_icon_handle,
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

--local upper_titlebarcolor  = gears.color({
--    type  = "linear",
--    from  = { 0, 0 },
--    to    = { 0, 120 },
--    stops = { {0, "#000000"}, {0.9, "#505050" .. "00"}}
--})
local upper_titlebarcolor = gears.color({
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
    --stops = {{5.9, "#828282" }, {0.1, "#bbbbbb" }} -- XP era silver gradient
    stops = {{5.9, "#9c9c9c" }, {0.1, "#bbbbbb" }} -- a bit more matte.
})

local darksilverbar  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    --stops = {{5.9, "#121212" }, {0.1, "#848484" }} -- a bit more matte.
    stops = {{5.9, "#717171" }, {0.1, "#383838" }} -- a bit more matte.
})

local darkbluebar  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    --stops = {{5.9, "#121212" }, {0.1, "#848484" }} -- a bit more matte.
    --stops = {{5.9, "#46478B" }, {0.1, "#131313" }} -- a bit more "sonic".
    --stops = {{5.9, "#9b9bbc" }, {0.1, "#131313" }} --
    stops = {{5.9, "#676773" }, {0.1, "#9b9bbc" .. "50"  }} -- matte grey/blue
})

local googlegreen  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    stops = {{5.9, "#9fb0a6" }, {0.1, "#668371" }} -- a bit more matte.
})


local occupiedblue  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
--    stops = {{0.3, "#8E8E8E"}, {0.65, "#BBBBBB"}} -- Light (top dark)
--    stops = {{0.3, "#bbbbbb"}, {0.65, "#6b6b6b"}} -- A bit darker (bottom dark)
    --stops = {{5.9, "#6C8797" }, {0.1, "#416081" }} -- a bit darker (bottom dark)
    stops = {{5.9, "#416081" }, {0.1, "#6c8797" }} -- a bit darker (bottom dark)
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


--Client Titlebar windows (taking gradient colors) --
theme.titlebar_bg_focus = darkbluebar
theme.titlebar_fg_focus = "#000000"


-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all
-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end

-- System Tray --- this hides the system tray as its packed inside of this widget. --
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
emailholder = wibox.container.margin(email, dpi(8), dpi(0), dpi(5),dpi(5)) -- email

-- Computer stats Widgets --------------{{
-- WINDOWS VM identifier.
vmholder = wibox.container.margin(vm, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
-- GPU HOLDER(s)
--gpuhunter.bg = "#ff0000"
gpuholder = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
gputempsholder = wibox.container.margin(gputemps, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm

-- Physical Environment Widgets-------- {{
-- temperature holder
temperatureholder = wibox.container.margin(temperature, dpi(0), dpi(0), dpi(5),dpi(2)) -- c893c5 vm
-- humidity holder
humidityholder = wibox.container.margin(humidity, dpi(0), dpi(5), dpi(5),dpi(2)) -- c893c5 vm
-- Air quality holder
airqualityholder = wibox.container.margin(airquality, dpi(0), dpi(0), dpi(5),dpi(2)) -- c893c5 vm

---------------------------------------}}}}
local cornershifter = gears.color({
	type = "linear",
	from = { dpi(12), 0},
	to   = { dpi(182), 20},
	--stops = { {0.15, "#A75374" .. "20"}, {0.75, "#FF1b4d" .. "75"} }
	stops = { {0.15, "#A75374" .. "30"}, {0.85, "#FFF577" .. "95"} } -- deep red to gold gradient
})

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
--local ddcshiftholder = wibox.container.margin(ddcshift({ main_color = "#A5A5A6", background_color = "#343434", margins=5, shape = 'hexagon',}), dpi(5), dpi(35), dpi(1), dpi(1)) -- 1080p
--local ddcshiftholder = wibox.container.margin(ddcshift({ main_color = silverbar, background_color = "#343434", margins=6, shape = 'rectangle',}), dpi(4), dpi(4), dpi(-4), dpi(0)) -- 1080p
local ddcshiftholder = wibox.container.margin(ddcshift({ main_color = silverbar, background_color = "#343434", margins=6, shape = 'rectangle',}), dpi(4), dpi(4), dpi(12), dpi(12)) -- 1080p
-- Redshift Bar
--local redshiftholder = wibox.container.margin(redshift({ main_color = cornershifter, background_color = "#343434", margins=6, shape = 'rectangle',}), dpi(4), dpi(4), dpi(-4), dpi(0)) -- 1080p
local redshiftholder = wibox.container.margin(redshift({ main_color = cornershifter, background_color = "#343434", margins=6, shape = 'rectangle',}), dpi(4), dpi(4), dpi(12), dpi(12)) -- 1080p


local bar_holders = wibox.widget {
	ddcshiftholder,
    redshiftholder,
    volumewidget,
	layout = wibox.layout.fixed.vertical,
}
local bar_holders = wibox.container.background(bar_holders,theme.bg_focus) -- retro green 2

-- shapes
-- hexagon nicely squeezed
local goodhexa = function(cr, width, height)
--    gears.shape.hexagon(cr, 50, 50)
--    gears.shape.transform(gears.shape.hexagon) : translate(0,5)(cr,70,50)
    gears.shape.transform(gears.shape.hexagon) : rotate_at(35,24,math.pi)(cr,70,47)
--    goodhexa.transform(shape.hexagon) : translate(0,15)(cr,70,20)
end

local goodparal = function(cr, width, height)
--      gears.shape.transform(gears.shape.parallelogram) : scale(0.1, 1)(cr,540,70)
--    gears.shape.partially_rounded_rect(cr, 140, 140, true)
--      gears. shape.partially_rounded_rect(cr, 300, 50, false, false, true, false, 30)
        --gears.shape.rectangular_tag(cr, 300, 50)
--        gears.shape.transform(gears.shape.rectangular_tag) : rotate_at(150,35,3*math.pi/3) (cr,300,70) -- decent
        --gears.shape.transform(gears.shape.rectangular_tag) : rotate_at(150,35, 3*math.pi/3) (cr,300,70)
        gears.shape.transform(gears.shape.rectangular_tag) : rotate_at(150,25, 3*math.pi/3) (cr,305,120)
    --gears.shape.transform(gears.shape.hexagon) : translate(10,25)(cr,20,70)
--    gears.shape.hexagon(cr, 320, 50)

end

local cornerparal = function(cr, width, height)
        gears.shape.transform(gears.shape.rectangular_tag) : rotate_at(97,15, 3*math.pi/3) (cr,215,45)
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

s.mytaglistn = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
        shape = gears.shape.rectangle,
        bg_focus = theme.highlight, -- google green sel
       -- bg_occupied = occupiedblue,
        bg_occupied = theme.taglist_bg_occupied
    },
    layout   = {
        spacing = 5,
        spacing_widget = {
            color  = theme.taglist_bg_empty,
            --color  = silverbar,
            shape  = gears.shape.rectangle,
            widget = wibox.widget.separator,
        },
        layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {
                {
                    {
                        {
                            id     = 'index_role',
                            widget = wibox.widget.background,
                        },
                        margins = 3,
                        widget  = wibox.container.margin,
                    },
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 3,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 1,
            right = 1,
            widget = wibox.container.margin
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
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, {
         bg_focus = "#B6BD68",
         spacing = 4,
          font = theme.taglist_font,
        })
--    mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.rectangle)
    s.mytag = wibox.container.margin(s.mytaglistn, dpi(3), dpi(3), dpi(3), dpi(3))
    mytagholder = wibox.container.background(s.mytag, theme.bg_normal, gears.shape.rectangle)

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
    --filter  = awful.widget.taglist.filter.all,
    filter  = orig_filter,
    style   = {
         bg_empty = theme.taglist_bg_empty_base .. "00",
         fg_empty = "#c2c3c2" .. "80",
        bg_occupied = tagbarbutton,
        --bg_occupied = googlegreen,

         fg_focus = "#c2c3c2" .. "80",
         fg_occupied = "#c2c3c2" .. "80",
        bg_focus = "#b3b3b2",
    },
    layout   = {
        spacing = 30,
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



    local mytaglistcont2 = wibox.container.background(s.mytaglist3, "#ffffff" .. "00", gears.shape.rectangle)
    s.mytag2 = wibox.container.margin(mytaglistcont2, dpi(15), dpi(15), dpi(15), dpi(10))

    -- Create a tasklist widget
  --  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.hexagon, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center" })
 --   s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.tasklist_bg_focus, shape = gears.shape.rectangle, align = "center" })
--    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = googlegreen, shape = gears.shape.rectangle, align = "center" })
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = silverbar, shape = gears.shape.rectangle, align = "center" })
  --  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.tasklist_bg_focus, shape = gears.shape.rectangle, align = "center" })
    --s.mytasklistholder = wibox.container.margin(s.mytasklist, dpi(100), dpi(30), dpi(4), dpi(1))
    s.mytasklistholder = wibox.container.margin(s.mytasklist, dpi(100), dpi(30), dpi(20), dpi(20))
    --s.mytasklistholder.visible = false
--    s.mytasklistholder:connect_signal("mouse::enter", function() toggle_tasklistholder() end)
--    function toggle_tasklistholder()
--         if s.mytasklistholder.visible == true
--         then s.mytasklistholder.visible = false
--         else s.mytasklistholder.visible = true end end


   -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.tasklist_bg_focus, shape = gears.shape.rectangle, align = "center" })


    s.titletasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, {
         bg_focus = "#121212" .. "00",
         fg_focus = "#ffffff",
         --font     = "Linux Biolinum 15",
         font     = "Iosevka 13",
         shape = gears.shape.rectangle,
         align = "center" })
    s.titletasklistholder = wibox.container.margin(s.titletasklist, dpi(650), dpi(24), dpi(20), dpi(10))

   --s.myleftwibox = wibox({screen = s, x=s.workarea.width, y =s.workarea.height, width = dpi(6), height = s.workarea.height, fg = theme.fg_normal, bg = theme.bg_normal, position = "top", ontop = true, visible = true, type = "dock" })
--   s.myleftwibox = wibox({screen = s, x=1240, y=s.workarea.height, width = s.workarea.width, height = dpi(32), fg = theme.fg_normal, bg = theme.bg_normal, ontop = true, visible = true, type = "dock" })


-- Create the main taskbar wibox.
screen[1].mywibox = awful.wibar(
  --  screen[1].mywibox = wibox(
        {
         screen = s,
         height = dpi(32),
         width = s.workarea.width,
         bg = gears.color.create_png_pattern(theme.panelbg),
         --bg = gears.color.create_png_pattern(theme.panelbg),
        visible = true,
         shape = gears.shape.rectangle
        }
    )
--    s.myleftwibox = awful.wibar({ position = "top", screen = s, height = dpi(32), })
-- Add widgets to the wibox
    screen[1].mywibox:setup {
   -- s.myleftwibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
         mytagholder,
            s.mypromptbox,
           -- s.mytasklistholder, -- Middle widget
            max_widget_size = 50,
        },
        {
            layout = wibox.layout.flex.horizontal,
            clockwidget,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
--        musicwidget,
-- --       vmholder, --  currently not using any vms
--       -- temperatureholder,
--       -- airqualityholder,
--       -- humidityholder,
--        -----------------------
        gputempsholder,
        gpuholder,
        cpuwidget,
--        ------------------
	    emailholder,
--	--    clockwidget,
        volumewidget,
        s.mylayoutbox,
        systrayholder,
        --halign = 'right',
        },
    }
-- if main screen then indent topbar down. (specific to main 3k monitor)
    if s.index == 1
    then
        ----- {{ TOP BAR}}
         screen[1].mywibox.height = dpi(38)
         --screen[1].mywibox.width = s.workarea.width - 50
         screen[1].mywibox.width = s.workarea.width
         screen[1].mywibox.y = 0
         --screen[1].mywibox.x = 20
         screen[1].mywibox.x = 0
         --screen[1].mywibox:struts({left=0, right=0, top=85, bottom=0})
         screen[1].mywibox:struts({left=0, right=0, top=45, bottom=0})


    end

function tagbar_hor(s)
	if s.index == 1
		then screen[1].mytagbar = tagbar {
--		screen[1].mytagbar = tagbar {
     --bg = "#282a36" .. "20",
     --bg = tagbarcolor,
     bg = gears.color.create_png_pattern(theme.tagbarbg),
      --bg = "#121212",
     -- bg = darksilverbar,
     screen = s,
     position = "bottom",
     --size = 60,
     size = 40,
     ontop = true,
    -- size_activator = 5,
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

        --temperatureholder,
        --airqualityholder,
        --humidityholder,
        --cpuwidget,
        --gpuholder,
        --gputempsholder,
--            s.mypromptbox,
        },
--        s.mytasklist, -- Middle widget
        { -- Right widgets
           layout = wibox.layout.fixed.horizontal,
--            mykeyboardlayout,
--            wibox.widget.systray(),
            --s.mylayoutbox,
            s.mytasklistholder, -- Middle widget
	    ddcshiftholder,
	    redshiftholder,
--        volumewidget,
        },
    }
end
end
gears.timer.delayed_call(tagbar_hor, s)

end
return theme
