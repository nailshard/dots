local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local widget = require("util.widgets")
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi
local icons = require("icons")

-- widget for the popup
local mpc = require("widgets.mpc")({ size = 16 })
local volume_bar = require("widgets.volume")({ mode = "slider" })
volume_bar.forced_width = dpi(40) -- set a max width

-- beautiful vars
local icon = beautiful.widget_mpc_button_icon or "  "
local fg = beautiful.widget_volume_fg
local bg = beautiful.widget_volume_bg
local font_button = beautiful.widget_icon_font_button or 'Iosevka Term 16'
local l = beautiful.widget_button_music_layout or 'horizontal'

-- for the popup
local fg_p = beautiful.fg_grey or "#aaaaaa"
local bg_p = beautiful.grey_dark or "#222222" -- same than the wibar
local padding = beautiful.widget_popup_padding or 1

local music_player_root = class()

function music_player_root:init(args)
  self.mode = args.mode or 'popup' -- possible values: block, popup
  self.wposition = args.position or widget.check_popup_position(beautiful.wibar_position)
  -- widgets
  self.title = widget.base_text()
  self.artist = widget.base_text()
  self.cover = widget.imagebox(80)
  self.time_pasted = widget.base_text()
  self.widget = self:make_widget()
end

function music_player_root:make_widget()
  if self.mode == "block" then
    return self:make_block()
  else
    return self:make_popup()
  end
end

function music_player_root:make_block()
  self.title.align = "left"
  self.title.forced_height = dpi(10) -- adjust to have one line
  self.time_pasted.align = "left"
  self.time_pasted.forced_height = dpi(10) -- adjust to have one line
  self.cover.forced_height = dpi(60)
  self.cover.forced_width = dpi(60)
  local w = wibox.widget {
    {
      self.cover,
      {
        widget.add_margin(self.title, { bottom = 5 }), 
        widget.add_margin(self.time_pasted, { top = 3, bottom = 5 }), 
        mpc,
        layout = wibox.layout.fixed.vertical
      },
      layout = wibox.layout.align.horizontal
    },
    forced_height = 80,
    top = dpi(10), bottom = dpi(10), -- adjust in order to limit the name to one line
    widget = wibox.container.margin
  }
  self:signals()
  return w
end

function music_player_root:make_popup()
  -- widget creation
  local button = widget.create_button(fg, icon)
  local w = awful.popup {
    widget = {
      {
        {
          self.cover,
          layout = wibox.layout.align.horizontal
        },
        {
          {
            self.title,
            self.artist,
            self.time_pasted,
            {
              {
                mpc,
                widget = wibox.container.margin
              },
              widget.add_margin(volume_bar, { left = 14 }),
              layout = wibox.layout.align.horizontal
            },
            spacing = dpi(2),
            layout = wibox.layout.fixed.vertical
          },
          left = 10,
          right = 4,
          widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
      },
      margins = dpi(10),
      forced_width = dpi(340),
      widget = wibox.container.margin
    },
    visible = false, -- do not show at start
    ontop = true,
    hide_on_right_click = true,
    preferred_positions = self.wposition,
    offset = { y = padding, x = padding }, -- no pasted on the bar
    bg = bg_p,
  }
  -- attach popup to widget
  w:bind_to_widget(button)

  self:signals()
  return widget.box(layout, { button })
end

-- update
function music_player_root:updates(mpd)
  -- default value
  local img = mpd.cover ~= nil and mpd.cover or icons["default_cover"]
  local title = mpd.title ~= nil and mpd.title or 'Unknown'
  local artist = mpd.artist ~= nil and mpd.artist or 'Unknown'

  self.cover.image = img
  self.title.markup = helpers.colorize_text(title, beautiful.alert)
  self.artist.markup = helpers.colorize_text("By "..artist, beautiful.primary)
end

function music_player_root:update_time(mpd)
  self.time_pasted.markup = helpers.colorize_text(mpd.full_time, beautiful.secondary)
end

-- signals
function music_player_root:signals()
  awesome.connect_signal("daemon::mpd", function(mpd)
    self:updates(mpd)
  end)
  awesome.connect_signal("daemon::mpd_time", function(mpd)
    self:update_time(mpd)
  end)
end

-- herit
local music_player_widget = class(music_player_root)

function music_player_widget:init(args)
  music_player_root.init(self, args)
  return self.widget
end

return music_player_widget
