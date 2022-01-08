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


textbox_notify_widget = wibox.widget {
	 font = "Iosevka 13",
	 widget = wibox.widget.textbox,
	}
textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
	widget = wibox.container.background,
}
mascarpone_widget = wibox.widget {
	textbox_notify_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}
emailbg = wibox.container.background(mascarpone_widget, "#Bd78D2")
--emailbg = wibox.container.background(mascarpone_widget, beautiful.somecolor)


local checkemails = [[bash -c 'ls ~/.local/share/mail/jon.burga@outlook.com/INBOX/new/ 2>/dev/null | wc -l']]

-- automatically scans for emails and updates widget in background
watch(
checkemails, 10,
function(widget, stdout, stderr, exitreason, exitcode)
  local unread_emails_num = tonumber(stdout) or 0
        if (unread_emails_num > 0) then
	        textbox_notify_widget:set_text( "📨 " ..  stdout .. "  " )
	        textbox_notify_widget:set_markup(markup(beautiful.email_alert, " 📨 " .. stdout .. " "))
        elseif (unread_emails_num == 0) then
	        textbox_notify_widget:set_text("📨_ ")
	        textbox_notify_widget:set_markup(markup("#000000", "__ "))
        end
    end
)

--return mascarpone_widget
return emailbg
