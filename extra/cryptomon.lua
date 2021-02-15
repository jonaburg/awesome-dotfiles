-------------------------------------------------
-- cryptomon
-------------------------------------------------
local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")

-- Create the text widget
local btc_text = wibox.widget{ -- total UK infected
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}
local tft_text = wibox.widget{ -- total dead
    		font = "Inconsolata 11",
    		widget = wibox.widget.textbox,
	}
local btc_holder = wibox.widget {  -- background holder 1
    		font = "Inconsolata 11",
		fg = (borders_color),
--		bg = ("#000000"),
		btc_text,
		widget = wibox.container.background,
	}
local tft_holder = wibox.widget { -- background holder 2
    		font = "Inconsolata 11",
		fg = (borders_color),
--		bg = ("#000000"),
		tft_text,
		widget = wibox.container.background,
	}

local crypto_widget = wibox.widget {
btc_holder,
tft_holder,
layout = wibox.layout.fixed.vertical,
}



function set_tag_color1()
--borders_color = "#719901" .. "35"
borders_color = "#719901"
btc_holder:set_fg(borders_color)
tft_holder:set_fg(borders_color)
end

function set_tag_color2()
	--yellow
--borders_color = "#ACAA01" .. "75"
borders_color = "#ff7827"
btc_holder:set_fg(borders_color)
tft_holder:set_fg(borders_color)
end

function set_tag_color3()
borders_color = "#01ac8d"
btc_holder:set_fg(borders_color)
tft_holder:set_fg(borders_color)
end


function set_tag_color4()
borders_color = "#414996"
btc_holder:set_fg(borders_color)
tft_holder:set_fg(borders_color)
end

function set_tag_color5()
borders_color = "#773737"
btc_holder:set_fg(borders_color)
tft_holder:set_fg(borders_color)
end


screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )



local catter = [[bash -c '/home/jon/.local/bin/utilities/finance btc']]
watch (
	catter,82800,
	function(_, stdout, stderr, reason, exit_code)
	btc_text:set_text( "₿ " .. stdout)
	end,
	crypto_widget
 )

local catter2 = [[bash -c '/home/jon/.local/bin/utilities/finance tft']]
watch (
	catter2,3600,
	function(_, stdout, stderr, reason, exit_code)
	tft_text:set_text( "🔺 " .. stdout)
	end,
	crypto_widget
 )


btc_text:set_text(" ??? ")
return crypto_widget

