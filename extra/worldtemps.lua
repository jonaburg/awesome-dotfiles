-------------------------------------------------
-- world temps
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")

local image2_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = bgicon,
    }

-- Create the text widget
local landquart_text = wibox.widget{ -- total UK infected
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}
local zurich_text = wibox.widget{ -- total dead
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}
local landquart_holder = wibox.widget {  -- background holder 1
    		font = "Inconsolata 11",
		bg = (borders_color),
		fg = ("#000000"),
		landquart_text,
		widget = wibox.container.background,
	}
local zurich_holder = wibox.widget { -- background holder 2
    		font = "Inconsolata 11",
		bg = (borders_color),
		fg = ("#000000"),
		zurich_text,
		widget = wibox.container.background,
	}

local worldtemp_widget = wibox.widget {
--image2_widget,
landquart_holder,
zurich_holder,
layout = wibox.layout.fixed.vertical,
}



function set_tag_color1()
--borders_color = "#719901" .. "35"
borders_color = "#719901"
landquart_holder:set_bg(borders_color)
zurich_holder:set_bg(borders_color)
end

function set_tag_color2()
	--yellow
--borders_color = "#ACAA01" .. "75"
borders_color = "#ff7827"
landquart_holder:set_bg(borders_color)
zurich_holder:set_bg(borders_color)
end

function set_tag_color3()
borders_color = "#01ac8d"
landquart_holder:set_bg(borders_color)
zurich_holder:set_bg(borders_color)
end


function set_tag_color4()
borders_color = "#414996"
landquart_holder:set_bg(borders_color)
zurich_holder:set_bg(borders_color)
end

function set_tag_color5()
borders_color = "#773737"
landquart_holder:set_bg(borders_color)
zurich_holder:set_bg(borders_color)
end


screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )



local catter = [[bash -c '/home/jon/.local/bin/utilities/worldtemps landquart']]
watch (
	catter,1200,
	function(_, stdout, stderr, reason, exit_code)
--	landquart_text:set_text( "🌤 lndqrt " .. stdout)
	landquart_text:set_text( "" .. stdout)
	end,
	worldtemp_widget
 )



landquart_text:set_text(" ??? ")
return worldtemp_widget

