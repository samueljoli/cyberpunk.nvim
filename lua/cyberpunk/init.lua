local utils = require('cyberpunk.utils')

local cyberpunk = {}

function cyberpunk.setup(opts)

  utils.configure(opts)

  utils.setup_theme()
end

return cyberpunk
