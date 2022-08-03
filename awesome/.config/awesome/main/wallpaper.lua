local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
-- local function set_wallpaper(s)
--   awful.wallpaper = {
--     screen = s,
--     widget = {
--       {
--         image = "usr/share/backgrounds/dolomites_cabin.jpg",
--         upscale = true,
--         downscale = true,
--         widget = wibox.widget.imagebox,
--       },
--       valign = "center",
--       halign = "center",
--       tiled = false,
--       widget = wibox.container.tile,
--     }
--   }
-- end

screen.connect_signal("property::geometry", set_wallpaper)

screen.connect_signal("request::wallpaper", function(s)
  set_wallpaper(s)
end)

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)
end)
