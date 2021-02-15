---------------------------
-- jon awesome theme 1 --
---------------------------

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}


theme.font          = "Inconsolata 10"
theme.taglist_font  = "Inconsolata 12"
theme.tasklist_font = "Inconsolata 12"

--theme.font          = "Linux Biolinum 10"
--theme.taglist_font  = "Linux Biolinum 17"
--theme.tasklist_font_focus = "Linux Biolinum 12"


theme.bg_normal     = "#000000"
theme.bg_focus      = "#535d6c"
theme.bg_focus2    = "#eeeeee"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(30)
theme.border_width  = dpi(4)
--theme.border_normal = "#000000"
--theme.border_normal = "#92aec8"
theme.border_normal = "#6b6b6b"
--theme.border_focus  = "#535d6c"
--theme.border_focus  = "#b3daff"
-- light blue
--theme.border_focus    = "#a4c1d6"
-- yellow
theme.border_focus    ="#c5c69a"
-- deeper indigo
--theme.border_focus    = "#b995da"
--theme.border_focus    = "#d0d0cd"
--theme.border_focus    = "#bdbdad"
--theme.border_marked = "#91231c"
--theme.border_marked = "#b3daff"
theme.border_marked    = "#92c895"


theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(160)
theme.menu_icon_size                            = dpi(132)


theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/jontheme"
theme.wallpaper                                 = theme.confdir .. "/wolf.png"
theme.menu_submenu_icon                         = theme.confdir .. "/icons/monomate.png"

--theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/default/"

theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/themes/jontheme"

--theme.bg_normal                                 = theme.confdir .. "/icons/bluebar.png"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"

--theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
--theme.taglist_squares_untitlebar_disable_icon                     = theme.confdir .. "/icons/square_b.png"
--theme.taglist_squares_sel                       = theme.confdir .. "/icons/line_sel.png"
--theme.taglist_squares_unsel                       = theme.confdir .. "/icons/line_sel.png"

-- blue/red rpgbar
theme.taglist_squares_sel                       = theme.confdir .. "/icons/stopsel.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/stopsel2.png"

-- vertical indicator bar
--theme.taglist_squares_sel                       = gears.surface.load_from_shape(dpi(2), dpi(30), gears.shape.rectangle, theme.fg_focus)
--theme.taglist_squares_unsel                     = gears.surface.load_from_shape(dpi(1), dpi(30), gears.shape.rectangle, theme.bg_focus2)

-- cleaner display info
--theme.border_normal                             = "#252525"
--theme.border_normal                             = "#252525"
--theme.border_focus                              = "#0099CC"


---------------------------------------------------------------------------  TASKLIST

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
--theme.tasklist_bg_image_normal 			=  theme.confdir .. "/icons/titlebar/bluebar.png"
--theme.tasklist_bg_image_focus 			=  theme.confdir .. "/icons/titlebar/gradient.png"
--theme.tasklist_bg_image_normal 			=  theme.confdir .. "/icons/titlebar/gradientDesktopBlack.png"
--theme.tasklist_bg_image_focus 			=  theme.confdir .. "/icons/titlebar/gradientDesktop.png"

-- YELLOW
--theme.tasklist_fg_normal =  "#ccc888"
theme.tasklist_fg_focus =  "#fffedb"
--theme.tasklist_bg_focus = "#000000"
--theme.tasklist_bg_image_focus 			=  theme.confdir .. "/icons/titlebar/gradientDesktop.png"
theme.tasklist_bg_image_focus 			=  theme.confdir .. "/icons/titlebar/gradientDesktopBlack4.png"
theme.tasklist_bg_image_normal 			=  theme.confdir .. "/icons/titlebar/gradientDesktopBlack34.png"


theme.layout_tile                               = theme.confdir .. "/icons/masterslave.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/davinci.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnify.png"
theme.layout_floating                           = theme.confdir .. "/icons/chat.png"
theme.layout_uselesstile                        = theme.confdir .. "/icons/monomate.png"
theme.layout_centerfair                           = theme.confdir .. "/icons/out.png"
theme.layout_cascade                            = theme.confdir .. "/icons/magnify.png"
theme.layout_center                             = theme.confdir .. "/icons/magnify.png"





--theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
--theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"

--theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/redbarsel.png"
--theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/bluebar2unsel.png"
theme.titlebar_close_button_normal           = theme.confdir .. "/icons/titlebar/maxi.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/maxi.png"

theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"

theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/unstickunsel.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/unstick.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/stiki.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/stiki.png"

theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/rainbowcircunsel.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/rainbowcirc.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/rainbowcircunsel.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/tealcirc.png"

theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/popoutunsel.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/popout.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maxi.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maxi.png"

theme.titlebar_plain_task_name                  = true
theme.titlebar_disable_icon                     = true

--theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
--theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
--theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"












-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"



--theme.titlebar_bg_focus = "#8a8a8a"
--theme.titlebar_bg_focus         = theme.confdir .. "/icons/monomate.png"
--theme.titlebar_bg_focus         = theme.confdir .. "/icons/titlebar/blubar.png"
--theme.titlebar_bg_normal         = theme.confdir .. "/icons/titlebar/blubar.png"



-----------------------------------------------------------             TAGLIST
--theme.taglist_bg_empty = "#222222"
theme.taglist_bg_empty = "#0a0e15"
--theme.taglist_bg_focus = "#535d63"
    --blueish
--theme.taglist_bg_focus = "#122d59"
-- halo blue
--theme.taglist_bg_focus = "#001f33"
    --green like vol
--theme.taglist_bg_focus = "#a2b881"
theme.taglist_bg_focus = "#757f57"
theme.taglist_fg_focus = "#000000"

--dark yellow
--theme.taglist_bg_occupied = "#7e577f"
--theme.taglist_bg_occupied = "#121a26"
theme.taglist_fg_occupied = "#000000"
--theme.taglist_fg_occupied = "#b1afa0"



-- theme.taglist_fg_focus = "#eeeea5"

-- theme.titlebar_bg_focus = "#c8da95"
 theme.titlebar_bg_focus = "#001f33"
-- beautiful.titlebar_fg_normal = "#ff0000"

-- using image png as titlebar
 theme.titlebar_bgimage_focus =  theme.confdir .. "/icons/titlebar/gradient.png"
 theme.titlebar_bgimage_normal =  theme.confdir .. "/icons/titlebar/darkgradient.png"

--[[
theme.titlebar_bgimage = function(context, cr, width, height)
     local pattern = gears.color(colors.titlebar.bg.normal)
    if client.focus == context.client then
        pattern = gears.color({ type = "linear",
                                from = { 0, 0 },
                                to = { width, 0 },
                                stops = { { 0, colors.titlebar.bg.normal },
                                          { 0.35, colors.titlebar.bg.focus },
                                          { 0.65, colors.titlebar.bg.focus },
                                          { 1, colors.titlebar.bg.normal },
                                        },
                              })
    end
    cr:set_source(pattern)
    cr:paint()
end
]]



--[[-- Generate taglist squares:
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)
]]

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(16)
theme.menu_width  = dpi(140)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"


-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray   = "#94928F"
-- Textclock
local mytextclock = wibox.widget.textclock(" %H:%M ")
mytextclock.font = theme.font


-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})


-- Separators


-- Separators
local first     = wibox.widget.textbox(markup.font("Terminus 3", " "))
local spr       = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("Terminus 4", " "))
local bar_spr   = wibox.widget.textbox(markup.font("Terminus 3", " ") .. markup.fontfg(theme.font, "#777777", "|") .. markup.font("Terminus 5", " "))



function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function() awful.layout.inc(-1) end),
                           awful.button({}, 4, function() awful.layout.inc(1) end),
                           awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
-- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = dpi(18), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            s.mytaglist,
            spr,
            s.mytxtlayoutbox,
            --spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            theme.mpd.widget,
            --theme.mail.widget,
            weathericon,
            theme.weather.widget,
            cpu.widget,
            mem.widget,
            bat.widget,
            net.widget,
            theme.volume.widget,
            clockicon,
            mytextclock,
        },

    }

end



return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
