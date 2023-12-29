local naughty = require('naughty')
local beautiful = require('beautiful')
local gears = require('gears')


-- Naughty presets
naughty.config.padding = 8
naughty.config.spacing = 8

naughty.config.defaults.timeout = 5
naughty.config.defaults.screen = 1
naughty.config.defaults.position = 'top_right'
naughty.config.defaults.margin = (16)
naughty.config.defaults.ontop = true
naughty.config.defaults.font = 'JetBrainsMono Nerd Font Regular 14px'
naughty.config.defaults.icon = nil
naughty.config.defaults.icon_size = (32)
naughty.config.defaults.shape = gears.shape.rounded_rect
naughty.config.defaults.border_width = 0
naughty.config.defaults.hover_timeout = nil

-- Error handling
if awesome.startup_errors then
  naughty.notify(
    {
      preset = naughty.config.presets.critical,
      title = 'Oops, there were errors during startup!',
      text = awesome.startup_errors
    }
  )
end

do
  local in_error = false
  awesome.connect_signal(
    'debug::error',
    function(err)
      if in_error then
        return
      end
      in_error = true

      naughty.notify(
        {
          preset = naughty.config.presets.critical,
          title = 'Oops, an error happened!',
          text = tostring(err)
        }
      )
      in_error = false
    end
  )
end

function log_this(title, txt)
  naughty.notify(
    {
      title = 'log: ' .. title,
      text = txt
    }
  )
end
