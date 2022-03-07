-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")


-- keys.lua
-- Contains Global Keys
local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local lain  = require("lain")

require("awful.autofocus")
local beautiful = require("beautiful")

local naughty = require("naughty")
require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")


--local helpers = require("helpers")
-- Custom modules
--local machi = require("module.layout-machi")
--local bling = require("module.bling")

-- swap_shift counter ()
function swap_shift ()
--	if awful.tag.selected(1).name == "1" then
--          screen[1].tags[1]:swap(screen[2].tags[1])
     screen[1].selected_tag:swap(screen[2].selected_tag)
end


-- Mouse Bindings
--awful.mouse.append_global_mousebindings({
--    awful.button({}, 6, awful.tag.viewprev),
--    awful.button({}, 7, awful.tag.viewnext)
--   -- awful.button({}, 4, function () lain.util.useless_gaps_resize(-5) end),
--   -- awful.button({}, 5, function () lain.util.useless_gaps_resize(5) end),
--})

-- Global Bindings
awful.keyboard.append_global_keybindings(
    {
          awful.key({ altkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ altkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    --awful.key({ altkey,           }, "Tab", function()awesome.emit_signal("widget::tagview::turn_on") end,
    awful.key({ altkey,           }, "Tab", function()awesome.emit_signal("tag_previewz::visibility::toggle") end,
              {description = "go back", group = "tag"}),

    -- Non-empty tag browsing
    awful.key({ modkey }, "g", function () lain.util.tag_view_nonempty(-1) end,
              {description = "view  previous nonempty", group = "tag"}),
    awful.key({ modkey }, ";", function () lain.util.tag_view_nonempty(1) end,
              {description = "view  previous nonempty", group = "tag"}),

    awful.key({ modkey }, "v", function ()
	   awesome.emit_signal("widget::panel::toggle") end,
              {description = "show panel (left)", group = "awesome"}),

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
--
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
    awful.key({ modkey, }, "s", function () lain.util.useless_gaps_resize(10) end,
              {description = "increment useless gaps", group = "tag"}),
    awful.key({ modkey, "Shift" }, "s", function () lain.util.useless_gaps_resize(-10) end,
              {description = "decrement useless gaps", group = "tag"}),

-- Scratch
--    awful.key({ modkey, "Shift" }, "n", function () scratch.toggle("st -n scratch", { instance = "scratch" }) end,
--              {description = "pop up scratchpad", group = "tag"}),

-- coin_scratch (Anim)
--    awful.key({ modkey}, "c", function () open_coin() end,
--              {description = "pop up scratchpad", group = "tag"}),
    awful.key({ modkey }, "c", function ()
	   awesome.emit_signal("widget::panel::toggle") end,
              {description = "show panel (left)", group = "awesome"}),
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

    })

-- Layout Machi
--awful.keyboard.append_global_keybindings(
--    {
--        awful.key({modkey}, ".",
--                  function() machi.default_editor.start_interactive() end, {
--            description = "edit the current layout if it is a machi layout",
--            group = "layout"
--        }),
--        awful.key({modkey}, "/",
--                  function() machi.switcher.start(client.focus) end, {
--            description = "switch between windows for a machi layout",
--            group = "layout"
--        })
--    })

-- Launcher and screen
--awful.keyboard.append_global_keybindings(
--    {
--        awful.key({modkey, "Control"}, "j",
--                  function() awful.screen.focus_relative(1) end,
--                  {description = "focus the next screen", group = "screen"}),
--        awful.key({modkey, "Control"}, "k",
--                  function() awful.screen.focus_relative(-1) end,
--                  {description = "focus the previous screen", group = "screen"}),
--        awful.key({modkey}, "d", function() awful.spawn(launcher) end,
--                  {description = "show rofi ", group = "launcher"}),
--        awful.key({modkey}, "e", function()
--            awful.spawn(gears.filesystem.get_configuration_dir() ..
--                            "scripts/rofi-emoji")
--        end, {description = "show rofi emoji", group = "launcher"}),
--
--        -- Standard program
--        awful.key({modkey}, "t", function() awful.spawn(terminal) end,
--                  {description = "open a terminal", group = "launcher"}),
--        awful.key({modkey, shift}, "t", function()
--            awful.spawn.easy_async_with_shell(
--                "slop -b 2 -c '0.61,0.9,0.75,1' -p -2", function(out)
--                    local mywidth, myheight, myx, myy =
--                        string.match(out, "(.*)x(.*)+(.*)+(.*)")
--
--                    awful.spawn(terminal, {
--                        geometry = {
--                            x = myx,
--                            y = myy,
--                            height = myheight,
--                            width = mywidth
--                        },
--                        floating = true
--                    })
--
--                end)
--        end, {description = "open a terminal", group = "launcher"}),
--        awful.key({modkey}, "s",
--                  function() awesome.emit_signal("scratch::music") end,
--                  {description = "open music", group = "scratchpad"}),
--        awful.key({modkey}, "z",
--                  function() awesome.emit_signal("widgets::peek") end,
--                  {description = "peek", group = "client"}),
--
--        awful.key({modkey}, "f", function() awful.spawn(filemanager) end,
--                  {description = "open file browser", group = "launcher"}),
--        awful.key({modkey}, "v",
--                  function() awesome.emit_signal("scratch::discord") end,
--                  {description = "open discord", group = "scratchpad"}),
--        awful.key({modkey}, "w", function()
--            awful.spawn.with_shell(browser)
--        end, {description = "open firefox", group = "launcher"}),
--
--        awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05) end, {
--            description = "increase master width factor",
--            group = "layout"
--        }), awful.key({modkey}, "h", function()
--            awful.tag.incmwfact(-0.05)
--        end, {description = "decrease master width factor", group = "layout"}),
--        awful.key({modkey, "Shift"}, "h",
--                  function() awful.tag.incnmaster(1, nil, true) end, {
--            description = "increase the number of master clients",
--            group = "layout"
--        }), awful.key({modkey, "Shift"}, "l",
--                      function() awful.tag.incnmaster(-1, nil, true) end, {
--            description = "decrease the number of master clients",
--            group = "layout"
--        }), awful.key({modkey, "Control"}, "h",
--                      function() awful.tag.incncol(1, nil, true) end, {
--            description = "increase the number of columns",
--            group = "layout"
--        }), awful.key({modkey, "Control"}, "l",
--                      function() awful.tag.incncol(-1, nil, true) end, {
--            description = "decrease the number of columns",
--            group = "layout"
--        }), awful.key({modkey}, "space", function() awful.layout.inc(1) end,
--                      {description = "select next", group = "layout"}),
--        awful.key({modkey, "Shift"}, "space",
--                  function() awful.layout.inc(-1) end,
--                  {description = "select previous", group = "layout"}), -- Set Layout
--        awful.key({modkey, "Control"}, "w",
--                  function() awful.layout.set(awful.layout.suit.max) end,
--                  {description = "set max layout", group = "tag"}),
--        awful.key({modkey}, "s",
--                  function() awful.layout.set(awful.layout.suit.tile) end,
--                  {description = "set tile layout", group = "tag"}),
--        awful.key({modkey, shift}, "s",
--                  function() awful.layout.set(awful.layout.suit.floating) end,
--                  {description = "set floating layout", group = "tag"}),
--
--        awful.key({modkey, "Control"}, "n", function()
--            local c = awful.client.restore()
--            -- Focus restored client
--            if c then
--                c:emit_signal("request::activate", "key.unminimize",
--                              {raise = true})
--            end
--        end, {description = "restore minimized", group = "client"})
--    })

-- Client management keybinds
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings(
        {
            awful.key({ modkey, "Shift" }, "space", awful.client.floating.toggle,
                      {description = "toggle floating", group = "client"}),
            awful.key({modkey}, "f", function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end, {description = "toggle fullscreen", group = "client"}),

            awful.key({modkey}, "q", function(c) c:kill() end,
                      {description = "close", group = "client"}),

            awful.key({ modkey, "Shift"}, "o", function (c) c:move_to_screen() end,
                      {description = "move to screen", group = "client"}),

--            awful.key({ modkey}, "v", function (c) swap_shift() end,
--                      {description = "swap_shift tags", group = "client"}),

            awful.key({modkey, shift}, "b", function(c)
                c.floating = not c.floating
		c.ontop = not c.ontop
                c.width = 800
                c.height = 500
                awful.placement.bottom_right(c)
                c.sticky = not c.sticky
            end, {description = "toggle keep on top", group = "client"}),
            awful.key({ modkey, "Shift" }, "u",
            function (c)
              c.floating = not c.floating
              c.width = c.screen.geometry.width* 4/7
              c.x = c.screen.geometry.x+(c.screen.geometry.width/5)
              c.height = c.screen.geometry.height * 0.43
              c.y = c.screen.geometry.height* 0.04
            end),

            awful.key({ altkey, "Shift"   }, "m",  lain.util.magnify_client,
                      {description = "magnify client", group = "client"}),


            awful.key({modkey}, "n", function(c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end, {description = "minimize", group = "client"}),
            awful.key({modkey}, "m", function(c)
                c.maximized = not c.maximized
                c:raise()
            end, {description = "(un)maximize", group = "client"}),
            awful.key({modkey, "Control"}, "m", function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end, {description = "(un)maximize vertically", group = "client"}),
            awful.key({modkey, "Shift"}, "m", function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end, {description = "(un)maximize horizontally", group = "client"}),

            -- On the fly padding change
            awful.key({modkey, shift}, "=",
                      function() helpers.resize_padding(5) end,
                      {description = "add padding", group = "screen"}),
            awful.key({modkey, shift}, "-",
                      function() helpers.resize_padding(-5) end,
                      {description = "subtract padding", group = "screen"}),

            -- On the fly useless gaps change
            awful.key({modkey}, "=", function()
                helpers.resize_gaps(5)
            end, {description = "add gaps", group = "screen"}),

            awful.key({modkey}, "-", function()
                helpers.resize_gaps(-5)
            end, {description = "subtract gaps", group = "screen"}),
            -- Single tap: Center client
            -- Double tap: Center client + Floating + Resize
            awful.key({modkey}, "c", function(c)
                awful.placement.centered(c, {
                    honor_workarea = true,
                    honor_padding = true
                })
                helpers.single_double_tap(nil, function()
                    helpers.float_and_resize(c, screen_width * 0.25,
                                             screen_height * 0.28)
                end)
            end)
        })
end)

-- Num row keybinds
awful.keyboard.append_global_keybindings(
    {
        awful.key {
            modifiers = {modkey},
            keygroup = "numrow",
            description = "only view tag",
            group = "tag",
            on_press = function(index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then tag:view_only() end
            end
        }, awful.key {
            modifiers = {modkey, "Control"},
            keygroup = "numrow",
            description = "toggle tag",
            group = "tag",
            on_press = function(index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then awful.tag.viewtoggle(tag) end
            end
        }, awful.key {
            modifiers = {modkey, "Shift"},
            keygroup = "numrow",
            description = "move focused client to tag",
            group = "tag",
            on_press = function(index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then client.focus:move_to_tag(tag) end
                end
            end
        }, awful.key {
            modifiers = {modkey, "Control", "Shift"},
            keygroup = "numrow",
            description = "toggle focused client on tag",
            group = "tag",
            on_press = function(index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then client.focus:toggle_tag(tag) end
                end
            end
        }, awful.key {
            modifiers = {modkey},
            keygroup = "numpad",
            description = "select layout directly",
            group = "layout",
            on_press = function(index)
                local t = awful.screen.focused().selected_tag
                if t then t.layout = t.layouts[index] or t.layout end
            end
        }
    })

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings(
        {
            awful.button({}, 1,
                         function(c)
                c:activate{context = "mouse_click"}
            end), awful.button({modkey}, 1, function(c)
                c:activate{context = "mouse_click", action = "mouse_move"}
            end), awful.button({modkey}, 3, function(c)
                c:activate{context = "mouse_click", action = "mouse_resize"}
            end)
        })
end)

-- EOF ------------------------------------------------------------------------
