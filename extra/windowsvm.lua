-------------------------------------------------
-- windowsVM widget
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local my_table = awful.util.table or gears.table
local testwidget_widget = {}
local windowsicon = '/home/jon/.config/awesome/themes/ethos/icons/windows95.png'
local windowshovericon = '/home/jon/.config/awesome/themes/ethos/icons/windows95on.png'

windows_icon_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = windowsicon,
	}

local watchstatus = [[bash -c 'sudo virsh list --all']]

local togglestate = [[bash -c '/home/jon/.local/bin/utilities/vmtoggle']]

-- hover to show unread count naughty notify
windows_icon_widget:connect_signal("mouse::enter", function() show_status() end)
windows_icon_widget:connect_signal("mouse::enter", function() windows_icon_widget:set_image(windowshovericon) end)
windows_icon_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )
windows_icon_widget:connect_signal("mouse::leave", function() windows_icon_widget:set_image(windowsicon) end)

--click to spawn newsboat
--awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
--news_image_widget:connect_signal("mouse::enter", function() launch_news()   end)

--news_image_widget:connect_signal("mouse::leave", function() news_image_widget:set_image(newsicon) end)


-- automatically scans for news and updates widget in background
watch(
watchstatus, 600,
function(widget, stdout, stderr, exitreason, exitcode)
  local status = tostring(stdout) or 0
--		newsicon = ' ' -- sets new icon when new news is received
--		newsicon = ' ' -- sets icon back to normal
    end
)

-- notification for email counter
function show_status()
    awful.spawn.easy_async([[bash -c 'sudo virsh list --all']],
        function(stdout, stderr, reason, exit_code)
            naughty.notify{
                text = stdout,
                title = "VMs Active",
                timeout = 10, hover_timeout = 1,
                width = 500,
		font = "Iosevka 14",
		position = 'top_middle',
		icon = noticon,
            }
        end
    )
end


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



return windows_icon_widget
