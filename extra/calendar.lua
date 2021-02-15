-------------------------------------------------
-- calboat widget
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}


local calicon = '/home/jon/.config/awesome/themes/spring2/icons/calicons/calendar.png'
local calhovericon = '/home/jon/.config/awesome/themes/spring2/icons/calicons/calendar.png'

cal_image_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = calicon,
	}
cal_widget = wibox.widget {
	cal_image_widget,
	layout = wibox.layout.fixed.horizontal,
}

local watchcal = [[bash -c ' calboat -x reload']]

--local tell_cal_number = [[bash -c 'calboat -x reload']]

-- hover to show unread count naughty notify
--cal_image_widget:connect_signal("mouse::enter", function() show_cal() end)
cal_image_widget:connect_signal("mouse::enter", function() cal_image_widget:set_image(calhovericon) end)
--click to spawn calboat


--awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
--cal_image_widget:connect_signal("mouse::enter", function() launch_cal()   end)




cal_image_widget:connect_signal("mouse::leave", function() cal_image_widget:set_image(calicon) end)
cal_image_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )


-- automatically scans for cal and updates widget in background
watch(
watchcal, 3600,
function(widget, stdout, stderr, exitreason, exitcode)
  local unread_cal_num = tonumber(stdout) or 0
        if (unread_cal_num > 0) then
--		calicon = ' ' -- sets new icon when new cal is received
        elseif (unread_cal_num == 0) then
--		calicon = ' ' -- sets icon back to normal
        end
    end
)

-- notification for email counter
function show_cal()
    awful.spawn.easy_async([[bash -c 'calboat -x print-unread']],
        function(stdout, stderr, reason, exit_code)
            naughty.notify{
                text = stdout,
                title = "Unread Articles",
                timeout = 10, hover_timeout = 1,
                width = 500,
		font = "Iosevka 14",
		position = 'bottom_right',
		icon = noticon,
            }
        end
    )
end


function set_tag_icon1()
calicon =  '/home/jon/.config/awesome/themes/spring2/icons/calicons/greenbook.png'
cal_image_widget:set_image(calicon)
end
function set_tag_icon2()
calicon =  '/home/jon/.config/awesome/themes/spring2/icons/calicons/brownbook.png'
cal_image_widget:set_image(calicon)
end
function set_tag_icon3()
calicon =  '/home/jon/.config/awesome/themes/spring2/icons/calicons/greenbook.png'
cal_image_widget:set_image(calicon)
end
function set_tag_icon4()
calicon =  '/home/jon/.config/awesome/themes/spring2/icons/calicons/bluebook.png'
cal_image_widget:set_image(calicon)
end
function set_tag_icon5()
calicon =  '/home/jon/.config/awesome/themes/spring2/icons/calicons/redbook.png'
cal_image_widget:set_image(calicon)
end



screen[1]:connect_signal("tag1", set_tag_icon1 )
screen[1]:connect_signal("tag2", set_tag_icon2 )
screen[1]:connect_signal("tag3", set_tag_icon3 )
screen[1]:connect_signal("tag4", set_tag_icon4 )
screen[1]:connect_signal("tag5", set_tag_icon5 )
screen[1]:connect_signal("tag6", set_tag_icon6 )



return cal_widget
