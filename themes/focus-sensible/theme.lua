--[[
	FOCUS_mbelish ver.
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
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/focus-sensible"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/focus-sensible/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/focus-sensible/wall.png"
theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/themes/focus-sensible"

--local email = require('extra.emailhorizontal')
local email = require('themes.focus-sensible.extra.email')
local redshift = require('extra.bars.redshift')
local ddcshift = require('extra.bars.ddcshift')

local gpuhunter = require('themes.focus-sensible.extra.gpuhunter')
local gputemps = require('themes.focus-sensible.extra.gputemps')

theme.font          = "Open Sans 10"
--theme.taglist_font  = "open sans 12"
theme.taglist_font  = "Iosevka 12"
theme.mpd_font  = "Open Sans 10"

--theme.tasklist_font = "Inconsolata 12"
theme.tasklist_font = "Linux Biolinum 12"
--theme.tasklist_font = "Times New Roman 12"
--theme.tasklist_font = "Iosevka 10"

-- email widget colors --
--theme.emailbg = "#ff0000"
theme.emailbg = "#dfffb7"

theme.textbg  = "#000000"
theme.textfg  = "#D8ffa3"

theme.fg_normal                                 = "#bababa"
theme.fg_focus					= "#e33a6e"
theme.bg_focus                                  = "#242424"
theme.bg_normal                                 = "#141414"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"

theme.border_width                              = dpi(2)
theme.border_normal                             = "#252525"
theme.border_focus                              = "#ADAFFF" .. "15"

   theme.tasklist_fg_focus                         = "#bee7b0" --yellow
   theme.tasklist_bg_focus                         = "#1c1c1c" --yellow

--taglist colors
theme.taglist_fg_focus                          = "#FFFFFF"
theme.taglist_bg_empty = "#0a0e15"
--theme.taglist_bg_focus = "#121a26"
--theme.taglist_bg_occupied = "#121a26"
theme.taglist_fg_occupied = "#b1afa0"
theme.tasklist_bg_normal                        = "#141414"
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
theme.useless_gap                               = dpi(15)
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
--local mytextclock = wibox.widget.textclock(markup("#FFFFFF", space3 .. "%H:%M   " .. markup.font("Roboto 4", " ")))
--local mytextclock = wibox.widget.textclock(markup("#fffede", "🕗 ") .. markup("#968F62", " %Y-%m-%d " .. markup("#C8ADFF", "%H:%M")))

--local mytextclock = wibox.widget.textclock(markup("#fffede", "🕗 ") .. markup("#968F62", " %Y-%m-%d " .. markup("#b599ff", "%H:%M"))) -- gold then purple
local mytextclock = wibox.widget.textclock(markup("#fffede", "🕗 ") .. markup("#b0bee7", " %Y-%m-%d " .. markup("#Bee7b0", "%H:%M"))) -- blue then green

--local mytextclock = wibox.widget.textclock(markup("#98ebc8", "🕗 ") .. markup("#fffede", " %Y-%m-%d %H:%M"))
--local mytextclock = wibox.widget.textclock(markup("#98ebc8", "🕗 ") .. markup("#fffede", "%H:%M"))
mytextclock.font = theme.font
local clock_icon = wibox.widget.imagebox(theme.clock)
local clockbg = wibox.container.background(mytextclock, theme.bg_focus, gears.shape.rectangle)
local clockwidget = wibox.container.margin(clockbg, dpi(0), dpi(3), dpi(5), dpi(5))
local mytextclock2 = wibox.widget.textclock(markup("#fffede", "📅 %d.%m.%y"))
local clockbg2 = wibox.container.background(mytextclock2, theme.bg_focus, gears.shape.rectangle)
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
    width = dpi(80), height = dpi(50), border_width = dpi(0),ticks = false, tick_size=3,
    colors = {
        background = "#383838",
        --unmute     = "#80CCE6",
        unmute     = "#465DFF",
        mute       = "#FF9F9F"
    },
})
theme.volume.bar.paddings = dpi(0)
theme.volume.bar.margins = dpi(3)
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
volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(10), dpi(11), dpi(11))

---- CPU
--local cpu_icon = wibox.widget.imagebox(theme.cpu)
--local cpu = lain.widget.cpu({
--	settings = function()
--        --widget:set_markup(markup.fontfg(theme.font, "#e33a6e", "💽 " ..  cpu_now.usage .. "%"))
--        widget:set_markup(markup.fontfg(theme.font, "#CECECE", "💽 " ..  markup("#ff0000", cpu_now.usage .. "%")))
--	end
----    settings = function()
----        widget:set_markup(space3 .. markup.font(theme.font, "CPU " .. cpu_now.usage
----                          .. "% ") .. markup.font("Roboto 5", " "))
----    end
--})
--local cpubg = wibox.container.background(cpu.widget, theme.bg_focus, gears.shape.rectangle)
--local cpuwidget = wibox.container.margin(cpubg, dpi(5), dpi(10), dpi(5), dpi(5))



-- CPU
local cpu = lain.widget.cpu({
	settings = function()
        widget:set_markup(markup.fontbg(theme.font, "#3d3d3d", cpu_now.usage .. "% "))
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
	bg = "#52677a", -- lighter blueish
	fg = "#000000",
	widget = wibox.container.background,
}
local cpu_bg_handle = wibox.widget {
	cpu,
         bg = "#3d3d3d",
	fg = "#c3c2c3",
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



-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all
-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end

-- System Tray
--systrayholder = wibox.container.margin(wibox.widget.systray0 dpi(16), dpi(16), dpi(7),dpi(7)) -- sytstray
mysystray = wibox.widget.systray()
mysystray.visible = false
systraybg = wibox.container.background(mysystray, "#ff0000", gears.shape.rectangle)
systrayholder = wibox.container.margin(systraybg, dpi(16), dpi(16), dpi(7),dpi(7)) -- sytstray

systrayholder:connect_signal("mouse::enter", function() show_systray() end)
systrayholder:connect_signal("mouse::leave", function() hide_systray() end)
systrayholder:connect_signal("mouse::enter", function() toggle_botbar() end)

function show_systray() mysystray.visible = true end
function hide_systray() mysystray.visible = false end


function toggle_botbar()
    if notmywibox.visible == false then
         notmywibox.visible = true
         else notmywibox.visible = false
     end
    end


emailholder = wibox.container.margin(email, dpi(5), dpi(5), dpi(5),dpi(5)) -- sytstray

local bluelingrad = gears.color({
	type = "linear",
	from = { dpi(12), 0},
	--to   = { dpi(52), 20},
	--to   = { dpi(152), 20},
	to   = { dpi(182), 20},
--	stops = { {0.1, "#FF1b4d" .. "50"}, {0.45, "#FF000C" .. "75"} }
	stops = { {0.15, "#FF1b4d" .. "100"}, {0.55, "#0083ff" .. "75"} }
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


-- Redshift Bar
local redshiftholder = wibox.container.margin(redshift({ main_color = bluelingrad, background_color = theme.bg_focus, margins=8, shape = 'hexagon',}), dpi(5), dpi(5), dpi(6), dpi(6))
local ddcshiftholder = wibox.container.margin(ddcshift({ main_color = "#c3c2c3", background_color = "#343434", margins=8, shape = 'hexagon',}), dpi(5), dpi(5), dpi(6), dpi(6)) -- 1080p
--
    -- Tags
  --  awful.layout.layouts = {layouts[1],layouts[2],layouts[1],layouts[1],layouts[1],layouts[1]},
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)


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
        spacing = 8,
        spacing_widget = {
            color  = theme.taglist_bg_empty,
            --color  = silverbar,
            --shape  = gears.shape.rectangle,
            shape  = gears.shape.hexagon,
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
                if self.bg ~= '#B57582' then
                    self.backup     = self.bg
                    self.has_backup = true
                end
                self.bg = '#B57582'
            end)
            self:connect_signal('mouse::leave', function()
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




    -- Create a promptbox for each screen
    --s.mypromptbox = awful.widget.prompt()
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.

    s.mylayoutbox = awful.widget.layoutbox(s)
--    s.mylayoutbox:buttons(my_table.join(
--                           awful.button({}, 1, function () awful.layout.inc( 1) end),
--                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
--                           awful.button({}, 3, function () awful.layout.inc(-1) end),
--                           awful.button({}, 4, function () awful.layout.inc( 1) end),
--                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
--    -- Create a taglist widget
--    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, { bg_focus = barcolor })
--    mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.rectangle)
--    s.mytag = wibox.container.margin(mytaglistcont, dpi(0), dpi(5), dpi(1), dpi(1))

    -- Create a tasklist widget
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.hexagon, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center" })
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = silverbar, shape = gears.shape.rectangle, align = "center" })
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.tasklist_bg_focus, shape = gears.shape.rectangle, align = "center" })


-- GPU HOLDER(s)
--gpuhunter.bg = "#ff0000"
gpuholder = wibox.container.margin(gpuhunter, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm
gputempsholder = wibox.container.margin(gputemps, dpi(0), dpi(0), dpi(5),dpi(5)) -- c893c5 vm



    -- Create the wibox
    screen[1].mywibox = awful.wibar({ position = "top", screen = s, height = dpi(32) })
-- Add widgets to the wibox
    screen[1].mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mytag,
            s.mytaglistn,
--            s.mylayoutbox,

            --spr_small,
            s.mypromptbox,
        },

        s.mytasklist, -- Middle widget
--        nil, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
--            theme.mail.widget,
            --bat.widget75
--            spr_right,
            musicwidget,
--            bar,
--            prev_icon,
--            next_icon,
--            stop_icon,
--            play_pause_icon,
--            bar,
--            mpd_icon,
--            bar,
--            spr_very_small,
--	    redshiftholder,
--            ddcshiftholder,
--	    volumewidget,
            spr_small,
--       	    cpuwidget,
	    clockwidget,
            spr_small,
--            volumewidget,
--            s.mylayoutbox,
            systrayholder,
      --      wibox.widget.systray(),
--            volumewidget,
--            spr_left,
        },
    }


-- Create the bottom taskbar wibox.
notmywibox = awful.wibar(
        {
        position = "bottom",
         screen = s,
         height = dpi(32),
         width = s.workarea.width,
     --    bg = "#171d23",
        visible = true,
         shape = gears.shape.rectangle
        }
    )
    notmywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
--            s.mytaglistn,
--            s.mytag,
            --s.cornertaglist,
        s.mypromptbox,
        },
       {
        layout = wibox.layout.fixed.horizontal,
	    redshiftholder,
        ddcshiftholder,
	    volumewidget,
        s.mytasklistholder, -- Middle widget
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
 --       vmholder, --  currently not using any vms
 --       temperatureholder,
 --       airqualityholder,
 --       humidityholder,
        cpuwidget,
        gpuholder,
        gputempsholder,
	    emailholder,
    --    spr_small,
        },
    }



end
return theme
