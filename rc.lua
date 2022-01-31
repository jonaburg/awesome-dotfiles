--[[
jon's awesomewm rip
--]]

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
--local menubar       = require("menubar")
local freedesktop   = require("modules.freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi

local scratch = require("extra.scratch")
--local smart_borders = require('smart_borders') {show_button_tooltips = true}
-- animation for scratch
local bling = require("modules.bling")  -- required for [tag preview / sliding animations ]
local rubato = require("modules.rubato")  -- required for [sliding animations ]
local awestore = require("awestore") -- required for modern async widget sidepanel sliding
--local collision = require("modules.collision")

-- Import Daemons and Widgets
--require("signal")
--require("ui")

-- garbage collector settings
--collectgarbage("setpause", 110)
--collectgarbage("setstepmul", 1000)
---- garbage collector settings (less intense battery saving GC
--collectgarbage("setpause", 160)
--collectgarbage("setstepmul", 400)
------------------------------------------------------------------------------------------------------------------------------ ANIMATIONS
---- animation from left --
local right_anim_y = awestore.tweened(-40, {
	duration = 100,
	--easing = awestore.easing.cubic_in_out
	easing = awestore.easing.sine_in_out
})
local right_anim_x = awestore.tweened(-2000, {
	duration = 100,
	--easing = awestore.easing.cubic_in_out
	easing = awestore.easing.sine_in_out
})

-- animation from top left --
local anim_y = awestore.tweened(-1000, {
	duration = 100,
	--easing = awestore.easing.cubic_in_out
	easing = awestore.easing.sine_in_out
})
local anim_x = awestore.tweened(-20, {
	duration = 100,
	--easing = awestore.easing.cubic_in_out
	easing = awestore.easing.sine_in_out
})
-- animation from top left --
local right_up_anim_y = awestore.tweened(-1000, {
	duration = 140,
	easing = awestore.easing.cubic_in_out
})
local right_up_anim_x = awestore.tweened(200, {
	duration = 140,
	easing = awestore.easing.cubic_in_out
})
-- animation from right --
local left_anim_y = awestore.tweened(0, {
	duration = 140,
	easing = awestore.easing.cubic_in_out
})
local left_anim_x = awestore.tweened(5000, {
	duration = 140,
	easing = awestore.easing.cubic_in_out
})
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

local coin_scratch = bling.module.scratchpad:new {
    command = "st -n coin",           -- How to spawn the scratchpad
    rule = { instance = "coin" },                     -- The rule that the scratchpad will be searched by
    sticky = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating
    geometry = {x=25, y=50, height=300, width=1200}, -- The geometry in a floating state
    reapply = true,                                   -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = false,                 -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
    awestore = {x = right_anim_x, y = right_anim_y}               -- Optional. This is how you can pass in the stores for animations. If you don't want animations, you can ignore this option.
}
local pape_scratch = bling.module.scratchpad:new {
    command = "st -n papes",           -- How to spawn the scratchpad
    rule = { instance = "papes" },                     -- The rule that the scratchpad will be searched by
    sticky = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating
    geometry = {x=25, y=50, height=900, width=1200}, -- The geometry in a floating state
    reapply = true,                                   -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = false,                 -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
    awestore = {x = right_up_anim_x, y = right_up_anim_y}               -- Optional. This is how you can pass in the stores for animations. If you don't want animations, you can ignore this option.
}
local music_scratch = bling.module.scratchpad:new {
    command = "st -n music",           -- How to spawn the scratchpad
    rule = { instance = "music" },                     -- The rule that the scratchpad will be searched by
    sticky = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating
    geometry = {x=25, y=500, height=900, width=1200}, -- The geometry in a floating state
    reapply = true,                                   -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = false,                 -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
    awestore = {x = left_anim_x, y = left_anim_y}               -- Optional. This is how you can pass in the stores for animations. If you don't want animations, you can ignore this option.
}

function open_music()
  local s_geo = awful.screen.focused().geometry
  music_scratch.geometry = {
    x = s_geo.width / 2,
    y = s_geo.height / 3,
    width = s_geo.width * 1/2,
    height = (s_geo.height) * 2/3
  }
  music_scratch:toggle()
end
function open_coin()
  local s_geo = awful.screen.focused().geometry
  coin_scratch.geometry = {
    x =0,
    y = 50,
    width = s_geo.width * 2/5,
    height = s_geo.height - 50
  }
  coin_scratch:toggle()
end
------------------------------------------------------------------------------------------------------------------------- FIN ANIM

-- PRESERVE TAG ON screen update (xrandr)
-- https://github.com/awesomeWM/awesome/issues/1344
tag.connect_signal("request::screen", function(t)
    for s in screen do
        if s ~= t.screen then
            local t2 = awful.tag.find_by_name(s, t.name)
            if t2 then
                t:swap(t2)
            else
                t.screen = s
            end
            return
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------

-- expose addono
--local revelation=require("revelation")
-- termgrp addon
-- radical menues/addon
--local radical = require("radical")

--local termgrp = require('termgrp')
--	termgrp.terminal = "st"
--	termgrp.dmenu = "rofi -dmenu"
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

--run_once({ "urxvtd", "unclutter -root" }) -- entries must be separated by commas


-- monitor switching...



-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

-- }}}

-- {{{ Variable definitions

local themes = {
    "jontheme",        -- 1 -- broken
    "winter",          -- 2 -- broken
    "spring",          -- 3 --broken?
    "spring2",         -- 4 -- broken
    "ethos",           -- 5 -- broken
    "vertex",          -- 6
    "focus",           -- 7
    "hunter",          -- 8
    "concencolor",     -- 9
    "focus-sensible",  -- 10
    "pioneer",         -- 11
    "google-2021",     -- 12
    "megid",     -- 13
    "grants",     -- 14
    "winter22",     -- 15
}
local chosen_theme = themes[15]
local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = "st"
local editor       = os.getenv("EDITOR") or "vim"
local gui_editor   = "gvim"
local browser      = "firefox"
local guieditor    = "atom"
local scrlocker    = "slock"



-- { define layouts
awful.layout.layouts = {
--    lain.layout.termfair.center,
--    lain.layout.centerwork,
--    awful.layout.suit.floating,
--    lain.layout.strutwide,
--    lain.layout.strutcenter,
    lain.layout.tile,
    lain.layout.uselesstile,
--    awful.layout.suit.tile,
--    awful.layout.suit.floating,
----    lain.layout.cascade,
--    awful.layout.suit.spiral,
    --awful.layout.suit.magnifier,
    }


layouts = awful.layout.layouts
tags = {
--	names = { " ", " ", " ", " ", " ", " ", "7", "8", "9" },
--	names = { "1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 " },
	layout = {layouts[1],layouts[1],layouts[1],layouts[1],layouts[1],layouts[1],
	icons = {
       		 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png",
       		 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png",
       		 "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png",
             "/home/jon/.config/awesome/themes/jontheme/icons/titlebar/slot.png"
    }

    }
}


--tag.connect_signal("property::selected", function(t)
    --awesome-spawn("Layout of tag " ..  " is now function ")
  --  awful.spawn(terminal .. " -e ranger")
--end)

awful.util.terminal = st
 awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7","8", "9" }
 awful.util.tagnames2 = { " ", " ", " ", " ", " ", " ", "7", "8", "9" }

--awful.layout.layouts = {
--    lain.layout.uselesstilecenter,
--    awful.layout.suit.tile,
--    lain.layout.cascade,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
--}


--tag.connect_signal("request::select", function(t)
----	screen.tag[i]:view_only()
--    if tag.name == "2" then
--   gears.wallpaper.maximized('/home/jon/.config/awesome/themes/spring2/wall.png', s, true )
--    else
--   gears.wallpaper.maximized('/home/jon/.config/awesome/themes/spring2/winter.png', s, true )
----        awful.titlebar.hide(t)
--end
--end)

--for _, t in ipairs(screen.selected_tags)
--            gears.wallpaper.maximized('/home/jon/.config/awesome/themes/spring2/winter.png', s, true )

--if ipairs(screen[1].tags) ~= 9
--then
--            gears.wallpaper.maximized('/home/jon/.config/awesome/themes/spring2/winter.png', s, true )
--	    awful.spawn(terminal .. " -e ranger")
--end

----------------------
---- configuration - edit to your liking
--wp_index = 1
--wp_timeout  = 10
--wp_path = "/home/jon/.config/awesome/themes/spring2/"
--wp_files = { "wall.png", "winter.png"}
--
---- setup the timer
--wp_timer = timer { timeout = wp_timeout }
--wp_timer:connect_signal("timeout", function()
--
--  -- set wallpaper to current index for all screens
--  for s = 1, screen.count() do
--    gears.wallpaper.maximized(wp_path .. wp_files[wp_index], s, true)
--  end
--
--  -- stop the timer (we don't need multiple instances running at the same time)
--  wp_timer:stop()
--
--  -- get next random index
--  wp_index = math.random( 1, #wp_files)
--
--  --restart the timer
--  wp_timer.timeout = wp_timeout
--  wp_timer:start()
--end)
--
---- initial start when rc.lua is first run
--wp_timer:start()
--------------------------------------


awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- }}}

require("configuration")

--- tag previews --
bling.widget.tag_preview.enable {
	show_client_content = true,
--	x = 20,
--	y = 100,
	x = screen_width / 3,
	--y = screen_height  - 420,
	y = screen_height  - 420,
	scale = 0.25,
	honor_padding = true,
	honor_workarea = false
}


-- {{{ Menu
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end }
}
awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or dpi(16),
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Open terminal", terminal },
        -- other triads can be put here
    }
})
-- hide menu when mouse leaves it
--awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)

--menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
-- }}}

---- {{{ Screen
---- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
--screen.connect_signal("property::geometry", function(s)
--    -- Wallpaper
--    if beautiful.wallpaper then
--        local wallpaper = beautiful.wallpaper
--        -- If wallpaper is a function, call it with the screen
--        if type(wallpaper) == "function" then
--            wallpaper = wallpaper(s)
--        end
--        gears.wallpaper.maximized(wallpaper, s, true)
--    end
--end)

---- No borders when rearranging only 1 non-floating or maximized client
--screen.connect_signal("arrange", function (s)
--    local only_one = #s.tiled_clients == 1
--    for _, c in pairs(s.clients) do
--        if only_one and not c.floating or c.maximized then
--            c.border_width = 0
--        else
--            c.border_width = beautiful.border_width
--        end
--end
--end)

-- Create a wibox for each screen and add it
--{{
--awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

--for s in screen do
--beautiful.at_screen_connect(s)
--end




-- }}}

-- {{{ Mouse bindings
root.buttons(my_table.join(
    --awful.button({ }, 6, awful.tag.viewprev),
    --awful.button({ }, 7, awful.tag.viewnext),
    awful.button({ }, 6, function () lain.util.tag_view_nonempty(-1) end),
    awful.button({ }, 7, function () lain.util.tag_view_nonempty(1) end),
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
--    awful.button({ }, 4, awful.tag.viewnext),
--    awful.button({ }, 5, awful.tag.viewprev)
-- only scroll through occupied tags
    --awful.button({ }, 4, function () lain.util.tag_view_nonempty(-1) end),
    --awful.button({ }, 5, function () lain.util.tag_view_nonempty(1) end)
-- change gaps size on scroll
    awful.button({}, 4, function () lain.util.useless_gaps_resize(-5) end),
    awful.button({}, 5, function () lain.util.useless_gaps_resize(5) end)

))

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
-- FIXED SCREEN GEOEMETRY MAX (e.g. no black bars in MPV)
                     size_hints_honor = true
     }
    },

    -- Scratchpad
       {
        rule_any = {
            instance = { "scratch" },
            class = { "scratch" },
            icon_name = { "scratchpad_st" },
        },
        properties = {
            skip_taskbar = false,
            floating = true,
            ontop = false,
            minimized = true,
            sticky = false,
            width = screen_width * 0.7,
            height = screen_height * 0.75
        },
        callback = function (c)
            awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
            gears.timer.delayed_call(function()
                c.urgent = false
            end)
        end
    },

    --    { rule = { class = "Steam",},
    --          properties = { maximized = false } },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = true } },
    -- Set Firefox to always map on the first tag on screen 1.
    { rule = { class = "Firefox" },
      properties = { screen = 1, tag = awful.util.tagnames[2] } },

    { rule = { class = "Gimp", role = "gimp-image-window" },
          properties = { maximized = true } },

--    { rule = { name = "Looking Glass (client)" },
----      properties = { floating = true, screen = 1, tag = awful.util.tagnames[1] },
--      properties = { floating = true, screen = 2 },
--	callback = function(c)
--		awful.client.moveresize(0,0,0,0,c)
--	end },

    { rule = { name = "Parsec" },
--      properties = { floating = true, screen = 1, tag = awful.util.tagnames[1] },
      properties = { floating = true },
	callback = function(c)
		awful.client.moveresize(-900,-50,3450,250,c)
	end },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
			 c.shape = gears.shape.rounded_rect
			 c.shape = function(cr,w,h)
		      	gears.shape.rounded_rect(cr,w,h,7) -- normal rounded
		      	--gears.shape.rounded_rect(cr,w,h,15)
		      	--gears.shape.rounded_rect(cr,w,h,0)
     		 	end
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
   --  if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = true})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

require("ui")

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251
-- }}}
