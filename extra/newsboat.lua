-------------------------------------------------
-- newsboat widget
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}


local newsicon = '/home/jon/.config/awesome/themes/spring2/icons/newsicons/Candy.png'
local newshovericon = '/home/jon/.config/awesome/themes/spring2/icons/newsicons/openbook.png'

news_image_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = newsicon,
	}
news_widget = wibox.widget {
	news_image_widget,
	layout = wibox.layout.fixed.horizontal,
}

local watchnews = [[bash -c ' newsboat -x reload']]

--local tell_news_number = [[bash -c 'newsboat -x reload']]

-- hover to show unread count naughty notify
--news_image_widget:connect_signal("mouse::enter", function() show_news() end)
news_image_widget:connect_signal("mouse::enter", function() news_image_widget:set_image(newshovericon) end)
--click to spawn newsboat


--awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
--news_image_widget:connect_signal("mouse::enter", function() launch_news()   end)




news_image_widget:connect_signal("mouse::leave", function() news_image_widget:set_image(newsicon) end)
news_image_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )


-- automatically scans for news and updates widget in background
watch(
watchnews, 3600,
function(widget, stdout, stderr, exitreason, exitcode)
  local unread_news_num = tonumber(stdout) or 0
        if (unread_news_num > 0) then
--		newsicon = ' ' -- sets new icon when new news is received
        elseif (unread_news_num == 0) then
--		newsicon = ' ' -- sets icon back to normal
        end
    end
)

-- notification for email counter
function show_news()
    awful.spawn.easy_async([[bash -c 'newsboat -x print-unread']],
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
newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/greenbook.png'
news_image_widget:set_image(newsicon)
end
function set_tag_icon2()
newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/brownbook.png'
news_image_widget:set_image(newsicon)
end
function set_tag_icon3()
newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/greenbook.png'
news_image_widget:set_image(newsicon)
end
function set_tag_icon4()
newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/bluebook.png'
news_image_widget:set_image(newsicon)
end
function set_tag_icon5()
newsicon =  '/home/jon/.config/awesome/themes/spring2/icons/newsicons/redbook.png'
news_image_widget:set_image(newsicon)
end



screen[1]:connect_signal("tag1", set_tag_icon1 )
screen[1]:connect_signal("tag2", set_tag_icon2 )
screen[1]:connect_signal("tag3", set_tag_icon3 )
screen[1]:connect_signal("tag4", set_tag_icon4 )
screen[1]:connect_signal("tag5", set_tag_icon5 )
screen[1]:connect_signal("tag6", set_tag_icon6 )



return news_widget
