local awful = require("awful")
local bling = require("bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local rubato = require("modules.rubato")


local right_up_anim_y = rubato.timed {
    pos = 0,
    rate = 90,
    easing = rubato.linear,
    intro = 0.05,
    duration = 0.1,
    awestore_compat = true -- This option must be set to true.
}

local right_up_anim_x = rubato.timed {
    pos = 0,
    rate = 90,
    easing = rubato.linear,
    intro = 0.05,
    duration = 0.1,
    awestore_compat = true -- This option must be set to true.
}


screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height


local email_scratch = bling.module.scratchpad:new {
    command = "st -n email",
    rule = { instance = "email" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=0, y=50, height=awful.screen.focused(), width=awful.screen.focused()}, -- The geometry in a floating state
   -- geometry = {x=400 , y=50, height=(screen_height / 2), width=screen_width * 3/5}, -- The geometry in a floating state
    reapply = true,
    dont_focus_before_close  = false,
--    rubato = {x = right_up_anim_x, y = right_up_anim_y}
}

function open_email()
  local s_geo = awful.screen.focused().geometry
  email_scratch.geometry = {
    x = 0,
    y = 30,
    width = s_geo.width,
    height = (s_geo.height) / 2
  }
  email_scratch:toggle()
end
