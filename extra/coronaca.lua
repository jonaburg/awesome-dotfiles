-------------------------------------------------
-- corona CA (REVISED)
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local fgicon = '/home/jon/.config/awesome/themes/spring/icons/brit.png'
local fgiconhover = '/home/jon/.config/awesome/themes/spring/icons/britblood.png'
local overlay = '/home/jon/.config/awesome/themes/spring/icons/harkonnen.png'


local image2_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = fgicon,
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
		fg = (borders_color),
		bg = ("#000000"),
		temp_text,
		widget = wibox.container.background,
	}
local amount_dead = wibox.widget { -- background holder 2
    		font = "Inconsolata 11",
		fg = (borders_color),
		bg = ("#000000"),
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
red_text:set_fg(borders_color)
amount_dead:set_fg(borders_color)
end

function set_tag_color2()
	--yellow
--borders_color = "#ACAA01" .. "75"
borders_color = "#B64400"
red_text:set_fg(borders_color)
amount_dead:set_fg(borders_color)
end

function set_tag_color3()
borders_color = "#6AC8C0" .. "75"
red_text:set_fg(borders_color)
amount_dead:set_fg(borders_color)
end


function set_tag_color4()
borders_color = "#6C7AF4" .. "85"
red_text:set_fg(borders_color)
amount_dead:set_fg(borders_color)
end

function set_tag_color5()
borders_color = "#C8030F" .. "85"
red_text:set_fg(borders_color)
amount_dead:set_fg(borders_color)
end


screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )



local catter = [[bash -c 'cat /tmp/ccountca']]
watch (
	catter,1200,
	function(_, stdout, stderr, reason, exit_code)
	temp_text:set_text("⛎ CA " .. stdout)
	end,
	temp2_widget
 )


temp_text:set_text(" ??? ")
return temp2_widget

