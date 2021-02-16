-------------------------------------------------
--Email Notification (Changing Pink -> Red BG indicator)
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local markup = lain.util.markup
local testwidget_widget = {}


textbox_widget = wibox.widget {
	 font = "Iosevka 13",
	widget = wibox.widget.textbox,
	}
textbox_notify_widget = wibox.widget {
	 font = "Iosevka 13",
	 widget = wibox.widget.textbox,
	}
textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
--	bg = "#c3c2c3", -- dark
	bg = "#A5A5A6", -- even darker
	fg = "#000000",
	widget = wibox.container.background,
}
mascarpone_widget = wibox.widget {
	textbox_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}
emailbg = wibox.container.background(mascarpone_widget, "#Bd78D2")


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
	        textbox_widget:set_text( " 📨 ")
	        textbox_widget:set_markup(markup("#000000", " 📨 "))
	        textbox_notify_widget:set_text( "  " ..  stdout .. "  " )
            emailbg:set_bg("#D9574F") -- striking red
        elseif (unread_emails_num == 0) then
   	        textbox_widget:set_text(" 📨")
	        textbox_widget:set_markup(markup("#000000", " 📨 "))
	        textbox_notify_widget:set_text("__ ")
      --      emailbg:set_bg("#Bd78D2") -- placehold bright pink
      --      emailbg:set_bg("#c893c5") -- annoying pink
     --       emailbg:set_bg("#CC9DEC") -- slightly mauve pnink
       --     emailbg:set_bg("#D2A2DE") -- pso pink
            emailbg:set_bg("#bea7c3") -- triadic pink
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


--return mascarpone_widget
return emailbg
