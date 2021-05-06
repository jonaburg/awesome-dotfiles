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
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi

local scratch = require("extra.scratch")
--local smart_borders = require('smart_borders') {show_button_tooltips = true}

-- animation for scratch
local bling = require("bling")  -- required for [tag preview / sliding animations ]
local awestore = require("awestore") -- required for modern async widget sidepanel sliding

------------------------------------------------------------------------------------------------------------------------------ ANIMATIONS
-- animation from left --
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
local email_scratch = bling.module.scratchpad:new {
    command = "st -n email",           -- How to spawn the scratchpad
    rule = { instance = "email" },                     -- The rule that the scratchpad will be searched by
    sticky = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating
    --geometry = {x=0, y=50, height=awful.screen.focused(), width=awful.screen.focused()}, -- The geometry in a floating state
    geometry = {x=screen_width / 5 , y=50, height=(screen_height / 2), width=screen_width * 3/5}, -- The geometry in a floating state
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

function open_email()
  local s_geo = awful.screen.focused().geometry
  email_scratch.geometry = {
    x = s_geo.width/13,
    y = 50,
    width = s_geo.width * 5/6,
    height = (s_geo.height) / 2
  }
  email_scratch:toggle()
end
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

--- tag previews --
bling.widget.tag_preview.enable {
	show_client_content = true,
	x = 20,
	y = 100,
--	x = screen_width / 8,
--	y = 1050,
	scale = 0.25,
	honor_padding = true,
	honor_workarea = false
}
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
    "pioneer",         -- 12
    "google-2021",     -- 13
}
local chosen_theme = themes[9]
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
    lain.layout.strutwide,
    lain.layout.strutcenter,
--    lain.layout.uselesstilecenter,
    awful.layout.suit.tile,
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
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
--    awful.button({ }, 4, awful.tag.viewnext),
--    awful.button({ }, 5, awful.tag.viewprev)
-- only scroll through occupied tags
    awful.button({ }, 4, function () lain.util.tag_view_nonempty(-1) end),
    awful.button({ }, 5, function () lain.util.tag_view_nonempty(1) end)

))
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(
--    -- Take a screenshot
--    -- https://github.com/lcpz/dots/blob/master/bin/screenshot
--    awful.key({ altkey }, "p", function() os.execute("screenshot") end,
--              {description = "take a screenshot", group = "hotkeys"}),
--
--    -- X screen locker
--    awful.key({ altkey, "Control" }, "l", function () os.execute(scrlocker) end,
--              {description = "lock screen", group = "hotkeys"}),

    -- Hotkeys
--    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
--              {description = "show help", group="awesome"}),
    -- Tag browsing
    awful.key({ altkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ altkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Non-empty tag browsing
    awful.key({ modkey }, "g", function () lain.util.tag_view_nonempty(-1) end,
              {description = "view  previous nonempty", group = "tag"}),
    awful.key({ modkey }, ";", function () lain.util.tag_view_nonempty(1) end,
              {description = "view  previous nonempty", group = "tag"}),
    -- Default client focus
--    awful.key({ altkey,           }, "j",
--        function ()
--            awful.client.focus.byidx( 1)
--        end,
--        {description = "focus next by index", group = "client"}
--    ),
--    awful.key({ altkey,           }, "k",
--        function ()
--            awful.client.focus.byidx(-1)
--        end,
--        {description = "focus previous by index", group = "client"}
--    ),

    -- By direction client focus
    awful.key({ modkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),
    awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

--    -- Layout manipulation

--    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
--              {description = "swap with next client by index", group = "client"}),
--    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
--              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
--    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
--              {description = "focus the next screen", group = "screen"}),
--    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
--              {description = "focus the previous screen", group = "screen"}),
--    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
--              {description = "jump to urgent client", group = "client"}),


--    awful.key({ modkey,           }, "Tab",
--        function ()
--            awful.client.focus.history.previous()
--            if client.focus then
--                client.focus:raise()
--            end
--        end,
--        {description = "go back", group = "client"}),

--    -- sticky float top (follow all over)
--    awful.key({ modkey }, "b", function (c)
--	    c.sticky = not c.sticky
--	    c.floating = not c.floating
--	    c.ontop = not c.ontop
--	   -- awful.client.moveresize(-900,-50,0,0,c)
--    end,
--        {description = "sticky", group = "awesome"}),

--    awful.key({}, "Super_L", function() awesome.emit_signal("bringup", function() end) end,
--    {description = "brings up slidebar", group = "client"}),


    -- On the fly useless gaps change
    awful.key({ modkey, }, "s", function () lain.util.useless_gaps_resize(5) end,
              {description = "increment useless gaps", group = "tag"}),
    awful.key({ modkey, "Shift" }, "s", function () lain.util.useless_gaps_resize(-5) end,
              {description = "decrement useless gaps", group = "tag"}),

-- Scratch
--    awful.key({ modkey, "Shift" }, "n", function () scratch.toggle("st -n scratch", { instance = "scratch" }) end,
--              {description = "pop up scratchpad", group = "tag"}),

-- coin_scratch (Anim)
    awful.key({ modkey}, "c", function () open_coin() end,
              {description = "pop up scratchpad", group = "tag"}),
-- pape_scratch (Anim)
--    awful.key({ modkey, "Shift" }, "n", function () pape_scratch:toggle() end,
--              {description = "pop up pape scratch", group = "tag"}),
-- email_scratch (Anim)
    awful.key({ modkey}, "e", function () open_email() end,
              {description = "pop up email scratch", group = "tag"}),
-- music_scratch (Anim)
    awful.key({ modkey}, "m", function () open_music() end,
              {description = "pop up mail scratch", group = "tag"}),

    -- Dynamic tagging
--    awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag() end,
--              {description = "add new tag", group = "tag"}),
    awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end,
              {description = "rename tag", group = "tag"}),
--    awful.key({ modkey, "Shift" }, "Left", function () lain.util.move_tag(-1) end,
--              {description = "move tag to the left", group = "tag"}),
--    awful.key({ modkey, "Shift" }, "Right", function () lain.util.move_tag(1) end,
--              {description = "move tag to the right", group = "tag"}),
    awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end,
              {description = "delete tag", group = "tag"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
--    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
--              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,    }, "o",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,    }, "y",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,    }, "u",     function () awful.client.incwfact( -0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,    }, "i",     function () awful.client.incwfact(0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    awful.key({ altkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ altkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ altkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ altkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
--    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
--              {description = "select previous", group = "layout"}),



    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Dropdown application
    awful.key({ modkey, }, "x", function () awful.screen.focused().quake:toggle() end,
              {description = "dropdown application", group = "launcher"}),

    -- Widgets popups
    awful.key({ altkey, }, "c", function () if beautiful.cal then beautiful.cal.show(7) end end,
              {description = "show calendar", group = "widgets"}),
    awful.key({ altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
              {description = "show filesystem", group = "widgets"}),
    awful.key({ altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
              {description = "show weather", group = "widgets"}),



    -- Brightness
    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end,
              {description = "-10%", group = "hotkeys"}),

    -- Volume (physical keyboard)
    awful.key({ }, "XF86AudioRaiseVolume",
    function ()
	    os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "+10% volume", group = "hotkeys"}),

    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "-10% volume", group = "hotkeys"}),
    awful.key({ }, "XF86AudioMute",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "toggle mute", group = "hotkeys"}),

    -- ALSA volume control
    awful.key({ modkey }, "=",
    function ()
        os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
            awesome.emit_signal("volumeup", function() end)
            beautiful.volume.update()
        end,
        {description = "volume up", group = "hotkeys"}),
    awful.key({ modkey }, "-",
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
            awesome.emit_signal("volumedown", function() end)
            beautiful.volume.update()
        end,
        {description = "volume down", group = "hotkeys"}),
    awful.key({ altkey }, "m",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "toggle mute", group = "hotkeys"}),
    awful.key({ altkey, "Control" }, "m",
        function ()
            os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "volume 100%", group = "hotkeys"}),
    awful.key({ altkey, "Control" }, "0",
        function ()
            os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "volume 0%", group = "hotkeys"}),

    -- MPD control
    awful.key({ altkey, "Control" }, "Up",
        function ()
            os.execute("mpc toggle")
            beautiful.mpd.update()
        end,
        {description = "mpc toggle", group = "widgets"}),
    awful.key({ altkey, "Control" }, "Down",
        function ()
            os.execute("mpc stop")
            beautiful.mpd.update()
        end,
        {description = "mpc stop", group = "widgets"}),
    awful.key({ altkey, "Control" }, "Left",
        function ()
            os.execute("mpc prev")
            beautiful.mpd.update()
        end,
        {description = "mpc prev", group = "widgets"}),
    awful.key({ altkey, "Control" }, "Right",
        function ()
            os.execute("mpc next")
            beautiful.mpd.update()
        end,
        {description = "mpc next", group = "widgets"}),

    -- Some MPD toggle notification
    awful.key({ altkey }, "0",
        function ()
            local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
            if beautiful.mpd.timer.started then
                beautiful.mpd.timer:stop()
                common.text = common.text .. lain.util.markup.bold("OFF")
            else
                beautiful.mpd.timer:start()
                common.text = common.text .. lain.util.markup.bold("ON")
            end
            naughty.notify(common)
        end,
        {description = "mpc on/off", group = "widgets"}),

    -- Copy primary to clipboard (terminals to gtk)
    --awful.key({ modkey }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
     --         {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    --awful.key({ modkey }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
     --         {description = "copy gtk to terminal", group = "hotkeys"}),

    -- User programs
--    awful.key({ modkey }, "q", function () awful.spawn(browser) end,
--              {description = "run browser", group = "launcher"}),
--    awful.key({ modkey }, "a", function () awful.spawn(guieditor) end,
--              {description = "run gui editor", group = "launcher"}),

    -- Default
    --[[ Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
    --]]
    --[[ dmenu
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("dmenu_run -i -fn 'Monospace' -nb '%s' -nf '%s' -sb '%s' -sf '%s'",
            beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "show dmenu", group = "launcher"})
    --]]
    -- alternatively use rofi, a dmenu-like application with more features
    -- check https://github.com/DaveDavenport/rofi for more details
    --[[ rofi
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("rofi -show %s -theme %s",
            'run', 'dmenu'))
        end,
        {description = "show rofi", group = "launcher"}),
    --]]
    -- Prompt
--    awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end,
 --             {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "z",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
    --]]
)



clientkeys = my_table.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ modkey,    }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),

    awful.key({ modkey, "Shift" }, "space",
    awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),

    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey, "Shift"           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
--    -- sticky float top (follow all over)
    awful.key({ modkey }, "b", function (c)
	  c.sticky = not c.sticky
	  c.floating = not c.floating
	  c.ontop = not c.ontop
          c.width = c.screen.geometry.width* 1/3
          c.x = c.screen.geometry.x+(0)
          c.height = c.screen.geometry.height * 0.43
          c.y = c.screen.geometry.height / 1.75
    end,
        {description = "sticky float top (follow all over (vid mode)", group = "awesome"}),

    awful.key({ modkey, "Shift" }, "u",
    function (c)
      c.floating = not c.floating
      c.width = c.screen.geometry.width* 4/7
      c.x = c.screen.geometry.x+(c.screen.geometry.width/5)
      c.height = c.screen.geometry.height * 0.43
      c.y = c.screen.geometry.height* 0.04
    end)



--    awful.key({}, "Super_L", function() awesome.emit_signal("asgotab", function() end) end,
--    {description = "brings up animated slidebar", group = "client"}),

--    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
--              {description = "toggle keep on top", group = "client"}),
--    awful.key({ modkey,           }, "n",
--        function (c)
--            -- The client currently has the input focus, so it cannot be
--            -- minimized, since minimized clients can't have the focus.
--            c.minimized = true
--        end ,
--        {description = "minimize", group = "client"}),
--    awful.key({ modkey,           }, "m",
--        function (c)
--            c.maximized = not c.maximized
--            c:raise()
--        end ,
--        {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

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
		      	gears.shape.rounded_rect(cr,w,h,0)
     		 	end
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
     if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)



-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 2, function() c:kill() end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = dpi(16)}) : setup {
        { -- Left
          --  awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = true})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251
-- }}}
