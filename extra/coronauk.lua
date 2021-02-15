-------------------------------------------------
-- corona recovered UK (REVISED)
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local bgicon = '/home/jon/.config/awesome/themes/spring/icons/brit.png'
local bgiconhover = '/home/jon/.config/awesome/themes/spring/icons/britblood.png'
local overlay = '/home/jon/.config/awesome/themes/spring/icons/harkonnen.png'


local image2_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = bgicon,
    }

-- Create the text widget
local temp_text = wibox.widget{ -- total UK infected
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}
local death_text = wibox.widget{ -- total dead
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}
local red_text = wibox.widget {  -- background holder 1
    		font = "Inconsolata 11",
		bg = (borders_color),
		fg = ("#000000"),
		temp_text,
		widget = wibox.container.background,
	}
local amount_dead = wibox.widget { -- background holder 2
    		font = "Inconsolata 11",
		bg = (borders_color),
		fg = ("#000000"),
		death_text,
		widget = wibox.container.background,
	}

local temp2_widget = wibox.widget {
--image2_widget,
red_text,
amount_dead,
layout = wibox.layout.fixed.vertical,
}



function set_tag_color1()
--borders_color = "#719901" .. "35"
borders_color = "#9BBA5A" .. "75"
red_text:set_bg(borders_color)
amount_dead:set_bg(borders_color)
end

function set_tag_color2()
borders_color = "#ACAA01" .. "75"
red_text:set_bg(borders_color)
amount_dead:set_bg(borders_color)
end

function set_tag_color3()
borders_color = "#6AC8C0" .. "75"
red_text:set_bg(borders_color)
amount_dead:set_bg(borders_color)
end


function set_tag_color4()
borders_color = "#6C7AF4" .. "85"
red_text:set_bg(borders_color)
amount_dead:set_bg(borders_color)
end

function set_tag_color5()
borders_color = "#C8030F" .. "85"
red_text:set_bg(borders_color)
amount_dead:set_bg(borders_color)
end


screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )



--temp2_widget:connect_signal("mouse::enter", function() show_brit() end)
--temp2_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )
temp2_widget:connect_signal("mouse::enter", function() image2_widget:set_image(bgiconhover) end)
temp2_widget:connect_signal("mouse::leave", function() image2_widget:set_image(bgicon) end)


local catter = [[bash -c 'cat /tmp/ccountukt']]
watch (
	catter,1200,
	function(_, stdout, stderr, reason, exit_code)
	temp_text:set_text(" " .. stdout)
	end,
	temp2_widget
 )
local catterdead = [[bash -c 'cat /tmp/ccountuk']]
watch (
	catterdead,1201,
	function(_, stdout, stderr, reason, exit_code)
	death_text:set_text(" " .. stdout)
	end,
	temp2_widget
 )

-- notification for britbongs
function show_brit()
    awful.spawn.easy_async([[bash -c 'cat /tmp/coronauk']],
        function(stdout, stderr, reason, exit_code)
            naughty.notify{
                text = stdout,
                title = "court writ yer honor",
                timeout = 30, hover_timeout = 5,
                width = 1250,
		font = "Iosevka 10",
		fg = ("#ff0000"),
		bg = ("#000000" .. "35"),
		position = 'top_middle',
		icon = overlay,
            }
        end
    )
end

temp_text:set_text(" ??? ")
return temp2_widget

