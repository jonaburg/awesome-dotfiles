-- wibar.lua
-- Wibar (top bar)
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
--local helpers = require("helpers")

local systray_margin = (beautiful.wibar_height - beautiful.systray_icon_size) /
                           2


-- Create the Wibar -----------------------------------------------------------

screen.connect_signal("request::desktop_decoration", function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create layoutbox widget
    s.mylayoutbox = awful.widget.layoutbox(s)

    -- Create the wibox
    s.mywibox = awful.wibar({position = "top", screen = s, type = "dock"})

    -- Remove wibar on full screen
    local function remove_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = false
        else
            c.screen.mywibox.visible = true
        end
    end

    -- Remove wibar on full screen
    local function add_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = true
        end
    end

    -- Hide bar when a splash widget is visible
    awesome.connect_signal("widgets::splash::visibility", function(vis)
        screen.primary.mywibox.visible = not vis
    end)

    client.connect_signal("property::fullscreen", remove_wibar)

    client.connect_signal("request::unmanage", add_wibar)

    -- Create the taglist widget
    s.mytaglist = require("ui.widgets.pacman_taglist")(s)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        bg = beautiful.xcolor0,
        style = {bg = beautiful.xcolor0},
        layout = {
            spacing = dpi(0),
            spacing_widget = {
                bg = beautiful.xcolor8,
                widget = wibox.container.background
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    nil,
                    awful.widget.clienticon,
                    nil,
                    layout = wibox.layout.fixed.horizontal
                },
                top = dpi(5),
                bottom = dpi(5),
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        }
    }

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.vertical,
        nil,
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                layout = wibox.layout.fixed.horizontal,
                {
                    {
                        {
                            awesome_icon,
                            s.mytaglist,
                            spacing = 15,
                            spacing_widget = {
                                color = beautiful.xcolor8,
                                shape = gears.shape.powerline,
                                widget = wibox.widget.separator
                            },
                            layout = wibox.layout.fixed.horizontal
                        },
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(10),
                    left = dpi(10),
                    right = dpi(5),
                    bottom = dpi(0),
                    widget = wibox.container.margin
                },
                s.mypromptbox,
                {
                    playerctl_bar,
                    top = dpi(10),
                    left = dpi(5),
                    bottom = dpi(0),
                    right = dpi(5),
                    widget = wibox.container.margin
                }
            },
            {
                {
                    {
                        s.mytasklist,
                        bg = beautiful.xcolor0 .. "00",
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(10),
                    left = dpi(5),
                    bottom = dpi(0),
                    right = dpi(5),
                    widget = wibox.container.margin
                },
                widget = wibox.container.constraint
            },
            {
                {
                    {
                        time_pill,
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(10),
                    left = dpi(5),
                    bottom = dpi(0),
                    right = dpi(5),
                    widget = wibox.container.margin
                },

                {
                    {
                        date_pill,
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(10),
                    left = dpi(5),
                    bottom = dpi(0),
                    right = dpi(5),
                    widget = wibox.container.margin
                },
                {
                    {
                        battery_pill,
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(10),
                    left = dpi(5),
                    bottom = dpi(0),
                    right = dpi(5),
                    widget = wibox.container.margin
                },
                {
                    awful.widget.only_on_screen(final_systray, screen[1]),
                    top = dpi(10),
                    left = dpi(5),
                    bottom = dpi(0),
                    right = dpi(5),
                    widget = wibox.container.margin
                },
                {
                    {
                        {
                            s.mylayoutbox,
                            top = dpi(4),
                            bottom = dpi(4),
                            right = dpi(7),
                            left = dpi(7),
                            widget = wibox.container.margin
                        },
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(10),
                    bottom = dpi(0),
                    left = dpi(5),
                    right = dpi(10),
                    widget = wibox.container.margin
                },

                layout = wibox.layout.fixed.horizontal
            }
        },
        {
            widget = wibox.container.background,
            bg = beautiful.widget_border_color,
            forced_height = 0
        }

    }
end)

-- EOF ------------------------------------------------------------------------
