-------------------------------------------------
--some image of the great british destruction bout to go down.
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local testwidget_widget = {}
local bgicon = '/home/jon/.config/awesome/themes/spring/icons/maxi.png'
--local bgicon = '/home/jon/.config/awesome/themes/spring/icons/bluebox.png'
--local bgicon = '/home/jon/.config/awesome/themes/spring/icons/coolbox.png'



local temp_image = wibox.widget{
	image = bgicon,
	resize = true,
        widget = wibox.widget.imagebox,
}
local temp_text = wibox.widget{
    		font = "Inconsolata 9",
    		widget = wibox.widget.textbox,
	}

local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_text)

local checkemails = [[bash -c 'ls ~/.local/share/mail/outlook/Inbox/new/ 2>/dev/null | wc -l']]

watch(
checkemails, 10,
function(widget, stdout, stderr, exitreason, exitcode)
  local unread_emails_num = tonumber(stdout) or 0
        if (unread_emails_num > 0) then
--        	email_icon:set_image(path_to_icons .. "/mail-mark-unread.png")
	        temp_widget:set_text(stdout .. "📧!" )
        elseif (unread_emails_num == 0) then
 --       	email_icon:set_image(path_to_icons .. "/mail-message-new.png")
   	        temp_widget:set_text("-")
        end
    end
)


temp_text:set_text("📧")

--temp_widget:set_widget(temp_image)
--temp_widget:add(temp_text)


temp_widget:connect_signal("mouse::enter", function() show_emails() end)
function show_emails()
    awful.spawn.easy_async([[bash -c 'ls ~/.local/share/mail/outlook/Inbox/new/ 2>/dev/null | wc -l']],
        function(stdout, stderr, reason, exit_code)
            naughty.notify{
                text = stdout,
                title = "Unread Emails",
                timeout = 5, hover_timeout = 0.5,
                width = 400,
            }
        end
    )
temp_widget:connect_signal("mouse::leave", function() naughty.destroy(notification) end )
end



return temp_widget
