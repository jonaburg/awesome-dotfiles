-------------------------------------------------
-- water temps
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")

local image2_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = fgicon,
    }

-- Create the text widget
local walensee_text = wibox.widget{ -- total UK infected
    		font = "Inconsolata 10",
    		widget = wibox.widget.textbox,
	}
local zurich_text = wibox.widget{ -- total dead
    		font = "Inconsolata 10",
    		widget = wibox.widget.textbox,
	}
local walensee_holder = wibox.widget {  -- background holder 1
    		font = "Inconsolata 11",
		fg = (borders_color),
		bg = ("#000000"),
		walensee_text,
		widget = wibox.container.background,
	}
local zurich_holder = wibox.widget { -- background holder 2
    		font = "Inconsolata 11",
		fg = (borders_color),
		bg = ("#000000"),
		zurich_text,
		widget = wibox.container.background,
	}

local temp2_widget = wibox.widget {
--image2_widget,
walensee_holder,
zurich_holder,
layout = wibox.layout.align.horizontal,

}



function set_tag_color1()
--borders_color = "#719901" .. "35"
borders_color = "#5a7317"
zurich_color = "#506614"
walensee_holder:set_fg(borders_color)
zurich_holder:set_fg(zurich_color)
end

function set_tag_color2()
	--yellow
--borders_color = "#ACAA01" .. "75"
borders_color = "#B64400"
zurich_color = "#A83F00"
walensee_holder:set_fg(borders_color)
zurich_holder:set_fg(zurich_color)
end

function set_tag_color3()
borders_color = "#6AC8C0" .. "75"
zurich_color = "#58a69f" .. "75"
walensee_holder:set_fg(borders_color)
zurich_holder:set_fg(zurich_color)
end


function set_tag_color4()
borders_color = "#6C7AF4" .. "85"
zurich_color = "#6774e8" .. "85"

walensee_holder:set_fg(borders_color)
zurich_holder:set_fg(zurich_color)
end

function set_tag_color5()
borders_color = "#C8030F" .. "85"
zurich_color = "#ba030e" .. "85"

walensee_holder:set_fg(borders_color)
zurich_holder:set_fg(zurich_color)
end


screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )



local catter = [[bash -c '/home/jon/.local/bin/utilities/watertemp walensee']]
local catter2 = [[bash -c '/home/jon/.local/bin/utilities/watertemp zurich']]
watch (
	catter,80000,
	function(_, stdout, stderr, reason, exit_code)
--	walensee_text:set_text( "🌊wls " .. stdout)
	walensee_text:set_text( "ws " .. stdout)
	end,
	temp2_widget
 )

watch (
	catter2,80000,
	function(_, stdout, stderr, reason, exit_code)
--	zurich_text:set_text( "🌊 zurich " .. stdout)
	zurich_text:set_text( " zh " .. stdout)
	end,
	temp2_widget
 )


walensee_text:set_text(" ??? ")
return temp2_widget

