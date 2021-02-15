-------------------------------------------------
--some image of the great british destruction bout to go down.
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local testwidget_widget = {}
local noticon = '/home/jon/.config/awesome/themes/ethos/icons/atreides.png'
local hoverbgicon = '/home/jon/.config/awesome/themes/ethos/icons/bluebox.png'
local bgicon = '/home/jon/.config/awesome/themes/ethos/icons/coolbox.png'

local mailicon = '/home/jon/.config/awesome/themes/ethos/icons/psoicons/mailpass.png'
local mailhover = '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-glow.png'
local newmail = '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-glow.png'

image_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = mailicon,
	}

textbox_widget = wibox.widget {
	 font = "Iosevka 15",
	widget = wibox.widget.textbox,
	}

mascarpone_widget = wibox.widget {
	textbox_widget,
	image_widget,
	layout = wibox.layout.fixed.horizontal,
}

local checkemails = [[bash -c 'ls ~/.local/share/mail/outlook/Inbox/new/ 2>/dev/null | wc -l']]
--local reademails = [[ bash -c '  for i in $(ls); do cat $i | egrep "Subject|From" | grep -v h=From | grep -v X-MS; done']]


--image_widget:connect_signal("mouse::enter", function() show_emails() end)
--image_widget:connect_signal("mouse::enter", function() email_text() end)
image_widget:connect_signal("mouse::enter", function() image_widget:set_image(mailhover) end)
image_widget:connect_signal("mouse::leave", function() image_widget:set_image(tag_specific_mailicon) end)
--image_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )


-- automatically scans for emails and updates widget in background
watch(
checkemails, 10,
function(widget, stdout, stderr, exitreason, exitcode)
  local unread_emails_num = tonumber(stdout) or 0
        if (unread_emails_num > 0) then
	        textbox_widget:set_text( stdout .. " " )
	--	mailicon = '/home/jon/.config/awesome/themes/spring2/icons/mailicons/mail.png'
	--      image_widget:set_image(mailicon)
        elseif (unread_emails_num == 0) then
		image_widget:set_image(tag_specific_mailicon )
   	        textbox_widget:set_text(" ")
        end
    end
)

function email_text()
    awful.spawn.easy_async([[bash -c 'for i in $(ls -1 /home/jon/.local/share/mail/outlook/Inbox/new/); do cat $i | egrep "Subject|From" | grep -v h=From | grep -v X-MS; done']],
    --awful.spawn.easy_async([[bash -c 'for i in $(ls /home/jon/.local/share/mail/outlook/Inbox/new/); do grep "Subject" $i;  done']],
	function (stdout, stderr, reason, exit_code)
		local emailheader = tostring(stdout)
     	       naughty.notify{
                text = stdout,
                title = "",
                timeout = 10, hover_timeout = 1,
                width = 500,
		font = "Iosevka 8",
		position = 'bottom_right',
		icon = noticon,
            }
	end)
end

-- notification for email counter
function show_emails()
    awful.spawn.easy_async([[bash -c 'ls ~/.local/share/mail/outlook/Inbox/new/ 2>/dev/null | wc -l']],
        function(stdout, stderr, reason, exit_code)
            naughty.notify{
                text = stdout,
                title = "Unread Emails",
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
mailicon =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-green.png'
image_widget:set_image(mailicon)
tag_specific_mailicon =  mailicon
end
function set_tag_icon2()
mailicon =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-yellow.png'
image_widget:set_image(mailicon)
tag_specific_mailicon =  mailicon
end
function set_tag_icon3()
mailicon =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-blue.png'
image_widget:set_image(mailicon)
tag_specific_mailicon =  mailicon
end
function set_tag_icon4()
mailicon =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-purp.png'
image_widget:set_image(mailicon)
tag_specific_mailicon =  mailicon
end
function set_tag_icon5()
mailicon =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-red.png'
image_widget:set_image(mailicon)
tag_specific_mailicon =  mailicon
end



screen[1]:connect_signal("tag1", set_tag_icon1 )
screen[1]:connect_signal("tag2", set_tag_icon2 )
screen[1]:connect_signal("tag3", set_tag_icon3 )
screen[1]:connect_signal("tag4", set_tag_icon4 )
screen[1]:connect_signal("tag5", set_tag_icon5 )
screen[1]:connect_signal("tag6", set_tag_icon7 )


return mascarpone_widget
