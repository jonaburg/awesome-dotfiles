-------------------------------------------------
--some image of the great british destruction bout to go down.
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local watch = require("awful.widget.watch")
local naughty = require("naughty")

local markup = lain.util.markup

local testwidget_widget = {}
local noticon = '/home/jon/.config/awesome/themes/ethos/icons/atreides.png'
local hoverbgicon = '/home/jon/.config/awesome/themes/ethos/icons/bluebox.png'
local bgicon = '/home/jon/.config/awesome/themes/ethos/icons/coolbox.png'

local mailicon =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-purp.png'
local mailhover =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-red.png'
local newmail =  '/home/jon/.config/awesome/themes/ethos/icons/mailicons/mail-red.png'

image_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        resize = false,
        image = mailicon,
	}

textbox_widget = wibox.widget {
	 font = "Iosevka 12",
	widget = wibox.widget.textbox,
	}

mascarpone_widget = wibox.widget {
	textbox_widget,
--	image_widget,
	layout = wibox.layout.fixed.horizontal,
}

local checkemails = [[bash -c 'ls ~/.local/share/mail/outlook/INBOX/new/ 2>/dev/null | wc -l']]
--local reademails = [[ bash -c '  for i in $(ls); do cat $i | egrep "Subject|From" | grep -v h=From | grep -v X-MS; done']]


--image_widget:connect_signal("mouse::enter", function() show_emails() end)
--image_widget:connect_signal("mouse::enter", function() email_text() end)
--image_widget:connect_signal("mouse::enter", function() image_widget:set_image(mailhover) end)
--image_widget:connect_signal("mouse::enter", function() textbox_widget:set_markup(markup("#ff0000", "📨 ")) end)
--image_widget:connect_signal("mouse::leave", function() image_widget:set_image(mailicon) end)
--image_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )


-- automatically scans for emails and updates widget in background
watch(
checkemails, 10,
function(widget, stdout, stderr, exitreason, exitcode)
  local unread_emails_num = tonumber(stdout) or 0
        if (unread_emails_num > 0) then
	        --textbox_widget:set_text( stdout .. " 📨" )
	        textbox_widget:set_text( " 📨 " ..  stdout )
	        textbox_widget:set_markup(markup("#E9E9E9", " 📨 " .. markup("#00FFFC", stdout )))
	--      textbox_widget:set_markup(markup("#00FFFC", " 📨" .. stdout ))
	--	mailicon = '/home/jon/.config/awesome/themes/spring2/icons/mailicons/mail.png'
	--      image_widget:set_image(mailicon)
        elseif (unread_emails_num == 0) then
--		image_widget:set_image(mailicon )
   	        textbox_widget:set_text("📨")
	        textbox_widget:set_markup(markup("#E9E9E9", "📨 "))
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


return mascarpone_widget
