--[[
	grants
--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi

local theme_assets = require("beautiful.theme_assets")
local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/grants"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/grants/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/grants/wall.png"
theme.lain_icons                                = os.getenv("HOME") .. "/.config/awesome/themes/grants"


--theme.font          = "Iosevka 12"
theme.font = "Open Sans 12"
theme.widget_font          = "Iosevka 13"
theme.calfont          = "Iosevka 14"
--theme.taglist_font  = "Iosevka 12"
theme.taglist_font  = "sf mono 12"
theme.mpd_font  = "Open Sans 10"
theme.tasklist_font = "sf mono 12"
--theme.tasklist_font = "Open Sans 12"
--theme.tasklist_font = "Iosevka 14"
--theme.highlight = "#A3C784" -- google green
--theme.highlight = "#88A67D" -- google green
theme.green = "#c2e1a1" -- google green
theme.red = "#EEA2A2" -- google red
theme.purp = "#A8A3EE" -- google purp
theme.yellow = "#F4E8a8" -- google yellowish
theme.blue = "#9ECDD2" -- google blue
theme.highlight = "#b6bfd5" -- google whiteish

theme.panelcolor = "#121212" .. 95 -- hexagonal background color
--theme.highlight = "#9ECDD2" -- blueish
--theme.highlight = "#5894C6" -- blueish
--theme.highlight = "#FFB028" -- orange

-- temp, gpu, cpu, starl, email etc colors
--theme.red_temp = "#A67D88" -- RED
--theme.red_temp = "#FDE4EB" -- RED
theme.red_temp = "#E3D9D9" -- RED gputemp
theme.green_use = "#DBE3D9" -- GREEN gpu hunter
theme.blue_use = "#D9E3E3" -- BLUE cpu widget
theme.yellow_portfolio = "#CBCCAD" -- yello portfolio



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
theme.fg_notification                           = "#ffffff"
--theme.bg_urgent                                 = "#B57582"

--theme.fg_urgent                                 = "#CC9393"
--theme.bg_urgent                                 = "#006B8E"

theme.border_width                              = dpi(2) -- normal
--theme.border_width                              = 0 -- with smart_borders ((watchout with strutwide.lua [c.border_width]))
--theme.border_normal                             = "#252525" .. "0"
theme.border_normal                             = "#191919"
--theme.border_focus                              = "#ADAFFF" .. "15"
--theme.border_focus                              = "#c3c997" .. "15"
--theme.border_focus                              = "#7289DA" .. "0"
theme.border_focus                              = "#191919"
--theme.border_focus                              = "#9fb0a6"

-- widget value colors
--theme.widget_value_bg = "#A5A5A6" -- greyish
--theme.widget_value_bg = "#A5A5A6"
theme.widget_value_bg = "#A5A5A6" .. "0"
theme.widget_value_fg = "#ffffff"
widget_value_bg = "#A5A5A6"
theme.my_color = "#ff0000"

--taglist colors
theme.taglist_fg_focus = "#000000"
--theme.taglist_bg_empty = "#f5f5f6" -- light
theme.taglist_bg_empty = "#c2c3c2" .. "20" -- darker
--theme.taglist_bg_empty = "#A5A5A6" -- evendarker
theme.taglist_fg_empty = "#000000"
theme.taglist_bg_occupied = "#6c8797" .. "65" -- background for upper tags (occupied but not selected)
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
theme.tag_preview_widget_bg = "#6e7aa6" .. "25"
theme.tag_preview_widget_border_color = "#ffffff"   -- The border color of the widget
theme.tag_preview_widget_border_width = 0.2
theme.tag_preview_widget_margin = 0

theme.fade_duration = 250

theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(160)
theme.menu_icon_size                            = dpi(32)
theme.awesome_icon                              = theme.icon_dir .. "/awesome_icon_white.png"
theme.titlebar                                  = theme.icon_dir .. "/pat7.png"
theme.clock                                     = theme.icon_dir .. "/clock.png"
--theme.panelbg                                   = theme.icon_dir .. "/panel.png"
theme.panelbg                                   = theme.icon_dir .. "/panelnotreal.png"
theme.side_panelbg                                   = theme.icon_dir .. "/solpan1.png"
--theme.side_panelbg                              = theme.icon_dir .. "/side_panel.png"
theme.side_panel_darker_bg                      = theme.icon_dir .. "/side_panel_darker.png"
theme.side_panel_blue                           = theme.icon_dir .. "/side_panel_blue.png"
theme.tagbarbg                                  = theme.icon_dir .. "/tagbar.png"
theme.tagbarbg_light                            = theme.icon_dir .. "/tagbar_light.png"
theme.psoman                                    = theme.icon_dir .. "/psoman.png"
theme.psoman_active                             = theme.icon_dir .. "/psoman_active.png"
theme.calendar                                  = theme.icon_dir .. "/cal.png"
theme.layout_tile                               = theme.confdir .. "/icons/monomate.png"
theme.layout_cascade                            = theme.confdir .. "/icons/magnifier.png"
theme.layout_uselesstile                        = theme.confdir .. "/icons/centerwork.png"
theme.layout_strutwide                        = theme.confdir .. "/icons/tile.png"
theme.layout_strutcenter                        = theme.confdir .. "/icons/centerwork.png"
theme.layout_floating                           = theme.icon_dir .. "/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(25)

theme.titlebar_close_button_normal              = theme.default_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.icon_dir.."/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.default_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.default_dir.."/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = theme.icon_dir.."/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.icon_dir.."/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.icon_dir.."/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.icon_dir.."/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme.icon_dir.."/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.icon_dir.."/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.icon_dir.."/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.icon_dir.."/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme.icon_dir.."/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.icon_dir.."/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.icon_dir.."/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.icon_dir.."/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.icon_dir.."/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.icon_dir.."/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.icon_dir.."/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.icon_dir.."/maximized_focus_active.png"


theme.musicplr = string.format("%s -e ncmpcpp", awful.util.terminal)
local markup = lain.util.markup


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
    stops = { {1.9, "#202020"}, {0.1, "#9e9e9e"}}
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

local sel_active  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    --stops = {{0.3, "#8E8E8E"}, {0.65, "#BBBBBB"}} -- Light (top dark)
--    stops = {{0.3, "#bbbbbb"}, {0.65, "#6b6b6b"}} -- A bit darker (bottom dark)
    stops = {{1.9, "#828282" }, {0.1, "#BDDDFF" }} -- XP era silver gradient
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

local xpsilver  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    stops = {{5.9, "#9f9fb0" }, {0.1, "#838383" .. "20" }} -- a bit more matte.
})

local sandgold  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    --stops = {{5.9, "#5e5e5e" }, {0.1, "#9D9F84" }} -- gold at the bottom
    stops = {{5.9, "#9d9f84" }, {0.1, "#5e5e5e" }} -- gold at the top
})

local sandsilver  = gears.color({
    type  = "linear",
    from  = { dpi(32), dpi(32) },
    to    = { dpi(32), 0 },
    stops = {{0.95, "#b9b9b9" }, {0.1, "#cececf" }, {0.1, "#e2e4e4" }, {0.95, "#e9ebea" }} -- macos (light bottom)
    --stops = {{0.8, "#e9ebea" }, {0.2, "#e2e4e4" }, {0.3, "#cececf" }, {0.8, "#b9b9b9" }} -- macos
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

local xpblue  = gears.color({
    type  = "linear",
    from  = { 0, dpi(64) },
    to    = { dpi(532), 0 },
    --stops = {{5.9, "#000e9f" }, {0.1, "#6c8797" }}
    stops = {{5.9, "#1050e2" }, {0.3, "#000e9f" } , { 0.1, "#002066" }}
    --stops = {{5.9, "#1050e2" }, {0.3, "#093bac" } , { 0.1, "#002066" }}
})

--Client Titlebar windows (taking gradient colors) --
theme.titlebar_bg_focus = xpblue
--theme.titlebar_bg_focus = gears.color.create_png_pattern(theme.titlebar)
theme.titlebar_fg_focus = "#000000"

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

-- Eminent-like task filtering (( this makes sure that all tags are shown, regardless of being used ))
local orig_filter = awful.widget.taglist.filter.all
-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end

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
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)


    s.mypromptbox = awful.widget.prompt()
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
               else
		       bling.widget.tag_preview.enable {
			       show_client_content = true,
			       x = 200,
			       y = 100,
			       scale = 0.5,
			       honor_padding = true,
			       honor_workarea = false,
		       }
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
    s.mytag = wibox.container.margin(s.mytaglistn, dpi(3), dpi(3), dpi(3), dpi(3))
    mytagholder = wibox.container.background(s.mytag, theme.bg_normal, gears.shape.rectangle)


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

         fg_focus = "#c2c3c2" .. "90",
         fg_occupied = "#c2c3c2" .. "90",
        --bg_focus = "#b3b3b2",
        --bg_focus = "#d3d2d3",
        --bg_focus = "#8fA0FC",
        --bg_focus = gears.color.create_png_pattern(beautiful.side_panel_blue),
        bg_focus = sel_active
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

-------------------------------------------------------------------------------------------------------------------
-- Create the titlebar
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

    awful.titlebar(c, {size = dpi(20)}) : setup {
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
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

------

---------------------------------------------------------------------------------

 -- Create a tasklist widget
 s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = silverbar, shape = gears.shape.rectangle, align = "center" })
 s.mytasklistholder = wibox.container.margin(s.mytasklist, dpi(20), dpi(20), dpi(10), dpi(10))


-- calls main source for bar widgets. after this, still need to wait a little in order to call this tagbar for the main screen.
require("ui.bars")
-- create the upper main horizontal bar --
main_upper_bar(s)
-- create the side panel(s) --
side_panel(s)

-- create the bottom tagbar and its associated deps --
gears.timer.delayed_call(create_taglist, s)
gears.timer.delayed_call(tagbar_horizontal, s)

end
return theme
