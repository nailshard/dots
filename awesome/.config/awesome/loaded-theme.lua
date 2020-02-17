local beautiful = require("beautiful")
local theme = {}

theme.name = "machine"

local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/"
beautiful.init( theme_dir .. theme.name .. "/theme.lua" )

return theme
