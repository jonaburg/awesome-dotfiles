-------------------------------------------------
-- comptoncontrol widget
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}
local comptonicon = '/home/jon/.config/awesome/themes/ethos/icons/paletriangle.png'
local comptonhovericon = '/home/jon/.config/awesome/themes/ethos/icons/strongtriangle.png'

comptoncontrol = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = comptonicon,
	}

local watchstatus = [[bash -c 'sudo virsh list --all']]

-- hover to show unread count naughty notify
comptoncontrol:connect_signal("mouse::enter", function() comptoncontrol:set_image(comptonhovericon) end)
comptoncontrol:connect_signal("mouse::leave", function() comptoncontrol:set_image(comptonicon) end)



-- automatically scans for news and updates widget in background
watch(
watchstatus, 600,
function(widget, stdout, stderr, exitreason, exitcode)
  local status = tostring(stdout) or 0
--		newsicon = ' ' -- sets new icon when new news is received
--		newsicon = ' ' -- sets icon back to normal
    end
)


--function set_tag_icon1()
--newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/greenbook.png'
--news_image_widget:set_image(newsicon)
--end
--function set_tag_icon2()
--newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/brownbook.png'
--news_image_widget:set_image(newsicon)
--end
--function set_tag_icon3()
--newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/greenbook.png'
--news_image_widget:set_image(newsicon)
--end
--function set_tag_icon4()
--newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/bluebook.png'
--news_image_widget:set_image(newsicon)
--end
--function set_tag_icon5()
--newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/redbook.png'
--news_image_widget:set_image(newsicon)
--end



--screen[1]:connect_signal("tag1", set_tag_icon1 )
--screen[1]:connect_signal("tag2", set_tag_icon2 )
--screen[1]:connect_signal("tag3", set_tag_icon3 )
--screen[1]:connect_signal("tag4", set_tag_icon4 )
--screen[1]:connect_signal("tag5", set_tag_icon5 )
--screen[1]:connect_signal("tag6", set_tag_icon6 )



return comptoncontrol
