local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")

--local path_to_icons = "/usr/share/icons/Moka/22x22/apps/"
local path_to_icons = "/home/jon/.config/awesome/themes/spring/icons/"

email_widget = wibox.widget.textbox()
email_widget:set_font('Play 9')

email_icon = wibox.widget.imagebox()
email_icon:set_image(path_to_icons .. "/popoutunsel.png")

watch(
    "python /home/jon/.config/awesome/extra/rates.py", 3601,
    function(widget, stdout, stderr, exitreason, exitcode)
        local chf = tonumber(stdout) or 0
        if (chf > 0) then
        	email_icon:set_image(path_to_icons .. "/0ad.png")
	        email_widget:set_text(" " .. stdout)
        elseif (chf == 0) then
        	email_icon:set_image(path_to_icons .. "/0ad.png")
   	        email_widget:set_text("yea")
        end

    end
)

return email_icon
