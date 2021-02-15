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

local textbox_widget = wibox.widget {
    text = '  ', -- windows icon
	font = "Iosevka 12",
	widget = wibox.widget.textbox,
	}
local textbox_notify_widget = wibox.widget {
 --    text = '  ', --fa super
	 font = "Iosevka 12",
	 widget = wibox.widget.textbox,
	}
local textbox_notify_widget_box = wibox.widget {
	textbox_notify_widget,
--	bg = "#c3c2c3", -- dark
	bg = "#A5A5A6", -- even darker
	fg = "#000000",
	widget = wibox.container.background,
}
local mascarpone_widget = wibox.widget {
	textbox_widget,
	textbox_notify_widget_box,
	layout = wibox.layout.fixed.horizontal,
}
local windowsvm = wibox.container.background(mascarpone_widget, "#4e78a3") -- windows era blue
--local windowsvm = wibox.container.background(mascarpone_widget, "#97c3c9") -- new windows blue

--	        textbox_widget:set_text( " 📨 ")
--	        textbox_widget:set_markup(markup("#000000", " 📨 "))
--	        textbox_notify_widget:set_text( "  " ..  stdout .. "  " )
--            emailbg:set_bg("#D9574F")


local watchstatus = [[bash -c "sudo virsh list --all | tail -2 | awk '{print \$3} ' "]]
--local watchstatus = [[bash -c "cat ~/.config/awesome/tmp/vmval"]]
--local watchstatus = [[bash -c "sudo virsh list --all | tail -2 | awk {'print $3'}" ]]
--local watchstatus = [[bash -c 'bash ~/.config/awesome/extra/windowsvmstatus.sh' ]]
--local watchstatus = [[bash -c 'cat ~/.config/awesome/extra/test' ]]

--local togglestate = [[bash -c '/home/jon/.local/bin/utilities/vmtoggle']]
-- hover to show unread count naughty notify
--windows_icon_widget:connect_signal("mouse::enter", function() show_status() end)
--windows_icon_widget:connect_signal("mouse::enter", function() windows_icon_widget:set_image(windowshovericon) end)
--windows_icon_widget:connect_signal("mouse::leave", function() naughty.destroy_all_notifications() end )
--windows_icon_widget:connect_signal("mouse::leave", function() windows_icon_widget:set_image(windowsicon) end)

-- automatically scans for VM status..
watch(
watchstatus, 60,
function(widget, stdout, stderr, exitreason, exitcode)
  local vm_status = tostring(stdout)
        if string.find(vm_status, "paused") then
            textbox_notify_widget:set_text(' __ ')
        end
        if string.find(vm_status, "running") then
            textbox_notify_widget:set_text(' + ')
        end
        if string.find(vm_status, "shut") then
            textbox_notify_widget:set_text('__ ')
        else
            textbox_notify_widget:set_text(vm_status)
        end
----        if vm_status == "paused" then
----            textbox_notify_widget:set_text('_')
----        end
----        if vm_status == "running" then
----            textbox_notify_widget:set_text('+')
----        end
----        if vm_status == "shut" then
----            textbox_notify_widget:set_text('x')
----        else
----            textbox_notify_widget:set_text(vm_status)
----        end
--	        textbox_notify_widget:set_text( "its paused")
--	        --textbox_widget:set_markup(markup("#000000", " 📨 "))
--	        --textbox_notify_widget:set_text( "  " ..  stdout .. "  " )
--            windowsvm:set_bg("#D9574F")
----        end
-- --       if vm_status == 'running' then
--        else
--   	        --textbox_notify_widget:set_text(" 📨")
--   	        textbox_notify_widget:set_text('not paused')
--	        --textbox_widget:set_markup(markup("#000000", " 📨 "))
----	        textbox_notify_widget:set_text(" nunrunnin ")
--            --windowsvm:set_bg("#Bd78D2")
--            windowsvm:set_bg("#ff0000")
--        end
    end
)

---- automatically scans for news and updates widget in background
--watch(
--watchstatus, 600,
--function(widget, stdout, stderr, exitreason, exitcode)
--  local status = tostring(stdout) or 0
----		newsicon = ' ' -- sets new icon when new news is received
----		newsicon = ' ' -- sets icon back to normal
--    end
--)
--
---- notification for email counter
--function show_status()
--    awful.spawn.easy_async([[bash -c 'sudo virsh list --all']],
--        function(stdout, stderr, reason, exit_code)
--            naughty.notify{
--                text = stdout,
--                title = "VMs Active",
--                timeout = 10, hover_timeout = 1,
--                width = 500,
--		font = "Iosevka 14",
--		position = 'top_middle',
--		icon = noticon,
--            }
--        end
--    )
--end

return windowsvm
