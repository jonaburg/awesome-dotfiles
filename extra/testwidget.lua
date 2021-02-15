-------------------------------------------------
-- House Icons to change based on Tag.
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local testwidget_widget = {}
local bgicon = '/home/jon/.config/awesome/themes/spring/icons/maxi.png'

-- dune houses
local atreides = '/home/jon/.config/awesome/themes/spring2/icons/dunehouses/atreides.png'
local harkonnen = '/home/jon/.config/awesome/themes/spring2/icons/dunehouses/harkonnen.png'
local ordos = '/home/jon/.config/awesome/themes/spring2/icons/dunehouses/ordos.png'


-- moneybags
local moneya = '/home/jon/.config/awesome/themes/spring2/icons/oot/walleta.png'
local moneyg = '/home/jon/.config/awesome/themes/spring2/icons/oot/walletg.png'

-- oot medallion
local foresty = '/home/jon/.config/awesome/themes/spring2/icons/oot/foresty.png'
local forest = '/home/jon/.config/awesome/themes/spring2/icons/oot/forest.png'
local spirit = '/home/jon/.config/awesome/themes/spring2/icons/oot/spirit.png'
local shadow = '/home/jon/.config/awesome/themes/spring2/icons/oot/shadow.png'
local water = '/home/jon/.config/awesome/themes/spring2/icons/oot/water.png'
local fire = '/home/jon/.config/awesome/themes/spring2/icons/oot/fire.png'
local light = '/home/jon/.config/awesome/themes/spring2/icons/oot/light.png'



local temp_image = wibox.widget{
	image = bgicon,
	resize = true,
        widget = wibox.widget.imagebox,
}


function set_tag_icon1()
temp_image:set_image(foresty)
end
function set_tag_icon2()
temp_image:set_image(light)
end
function set_tag_icon3()
temp_image:set_image(moneya)
end
function set_tag_icon4()
temp_image:set_image(water)
end
function set_tag_icon5()
temp_image:set_image(fire)
end
function set_tag_icon6()
temp_image:set_image(spirit)
end
function set_tag_icon7()
temp_image:set_image(shadow)
end
function set_tag_icon8()
temp_image:set_image(forest)
end
function set_tag_icon9()
temp_image:set_image(moneyg)
end




screen[1]:connect_signal("tag1", set_tag_icon1 )
screen[1]:connect_signal("tag2", set_tag_icon2 )
screen[1]:connect_signal("tag3", set_tag_icon3 )
screen[1]:connect_signal("tag4", set_tag_icon4 )
screen[1]:connect_signal("tag5", set_tag_icon5 )
screen[1]:connect_signal("tag6", set_tag_icon6 )
screen[1]:connect_signal("tag7", set_tag_icon7 )
screen[1]:connect_signal("tag8", set_tag_icon8 )
screen[1]:connect_signal("tag9", set_tag_icon9 )


local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_image)

return temp_widget
