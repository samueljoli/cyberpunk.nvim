local dark = require('cyberpunk.colors.dark')

local light = require('cyberpunk.colors.light')

local colors = {}

function colors.get_theme(settings)
  settings = settings or {}

  if settings.theme == 'dark' then
    return dark
  else
    return light
  end
end

return colors
