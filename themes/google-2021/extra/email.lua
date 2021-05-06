-------------------------------------------------
--Email Notification (Changing Pink -> Red BG indicator) (concencolor, relates to theme variable)
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local markup = lain.util.markup
local testwidget_widget = {}
local beautiful = require("beautiful")


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
	--bg = "#3d3d3d", 
	--fg = "#d8ffa3",
	widget = wibox.container.background,
}
mascarpone_widget = wibox.widget {
--	textbox_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}
--emailbg = wibox.container.background(mascarpone_widget, "#Bd78D2")
emailbg = wibox.container.background(mascarpone_widget, beautiful.somecolor)


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
	       -- textbox_widget:set_text( " 📨 ")
	        --textbox_widget:set_markup(markup("#000000", " 📨 "))
	        textbox_notify_widget:set_text( " 📨 " ..  stdout .. "  " )
	        textbox_notify_widget:set_markup(markup(beautiful.email_alert, " 📨 " .. stdout .. " "))
        elseif (unread_emails_num == 0) then
	        textbox_notify_widget:set_text("📨_ ")
	        --textbox_notify_widget:set_markup(markup("#000000", "__ "))
         --   emailbg:set_bg(beautiful.somecolor) -- triadic pink
        end
    end
)

--return mascarpone_widget
return emailbg
