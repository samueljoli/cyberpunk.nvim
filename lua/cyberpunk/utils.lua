local colors = require('cyberpunk.colors')

local api = vim.api

local utils = {}

local function set_highlights(highlights)
  for group, col in pairs(highlights) do
    api.nvim_command(string.format('highlight %s gui=%s guifg=%s guibg=%s guisp=%s',
      group,
      col.style or "NONE",
      col.fg or "NONE",
      col.bg or "NONE",
      col.sp or "NONE"
    ))

    if col.link then
      api.nvim_command(string.format("highlight! link %s %s", group, col.link))
    end
  end
end

local function make_editor_highlights(theme, settings)
  local highlights = {
    Header       = { fg = theme.white, bg = theme.none, theme.none },
    Normal       = { fg = theme.main, bg = theme.background_main, theme.none },
    Visual       = { fg = theme.none, bg = theme.base, theme.none },
    ColorColumn  = { fg = theme.none, bg = theme.none, theme.none },
    LineNr       = { fg = theme.main, bg = theme.none, theme.none },
    SignColumn   = { fg = theme.secondary_accent, bg = theme.none, theme.none },
    DiffAdd      = { fg = theme.none, bg = theme.none, theme.none },
    DiffDelete   = { fg = theme.none, bg = theme.red, theme.none },
    DiffText     = { fg = theme.none, bg = theme.secondary_accent, theme.none },
    DiffChnage   = { fg = theme.none, bg = theme.none, theme.none },
    VertSplit    = { fg = theme.main, bg = theme.background_accent, theme.none },
    IncSearch    = { fg = theme.none, bg = theme.secondary_light, theme.none },
    Search       = { fg = theme.none, bg = theme.secondary_light, theme.none },
    Substitute   = { fg = theme.none, bg = theme.secondary_light, theme.none },
    MatchParen   = { fg = theme.main, bg = theme.secondary_accent, theme.none },
    NonText      = { fg = theme.whitespace, bg = theme.none, theme.none },
    Whitespace   = { fg = theme.whitespace, bg = theme.none, theme.none },
    WildMenu     = { fg = theme.secondary_accent, theme.none, theme.bold },
    Directory    = { fg = theme.secondary_accent, theme.none, theme.none },
    Title        = { fg = theme.secondary_med, theme.none, theme.none },
    Cursor       = { fg = theme.secondary_accent, theme.secondary_hard, style = theme.underline },
    CursorLine   = { fg = theme.none, bg = theme.background_main, style = theme.underline },
    CursorLineNr = { fg = theme.dark, theme.secondary_accent, theme.none },
    CursorColumn = { fg = theme.none, bg = theme.none, theme.none },
    -- Code
    Comment      = { fg = theme.secondary_hard, bg = theme.none, theme.none },
    String       = { fg = theme.accent, bg = theme.none, theme.none },
    Number       = { fg = theme.yellow, bg = theme.none, theme.none },
    Float        = { fg = theme.yellow, bg = theme.none, theme.none },
    Boolean      = { fg = theme.yellow, bg = theme.none, theme.none },
    Character    = { fg = theme.yellow, bg = theme.none, theme.none },
    Conditional  = { fg = theme.accent, bg = theme.none, theme.none },
    Repeat       = { fg = theme.accent, bg = theme.none, theme.none },
    Label        = { fg = theme.accent, bg = theme.none, theme.none },
    Exception    = { fg = theme.accent, bg = theme.none, theme.none },
    Operator     = { fg = theme.accent, bg = theme.none, theme.none },
    Keyword      = { fg = theme.accent, bg = theme.none, theme.none },
    StorageClass = { fg = theme.secondary_light_med, bg = theme.none, theme.none },
    Statement    = { fg = theme.accent, bg = theme.none, theme.none },
    Function     = { fg = theme.secondary_light_med, bg = theme.none, theme.none },
    Identifier   = { fg = theme.white, bg = theme.none, theme.none },
    PreProc      = { fg = theme.secondary_accent_med, bg = theme.none, theme.none },
    Type         = { fg = theme.secondary_accent_med, bg = theme.none, theme.none },
    Structure    = { fg = theme.secondary_accent_med, bg = theme.none, theme.none },
    Typedef      = { fg = theme.secondary_accent_med, bg = theme.none, theme.none },
    Underlined   = { fg = theme.none, bg = theme.none, theme.none },
    Todo         = { fg = theme.secondary_accent_med, bg = theme.secondary_light, theme.none },
    Error        = { fg = theme.main_med, bg = theme.none, style = "undercurl" },
    WarningMsg   = { fg = theme.secondary_accent, bg = theme.none, theme.none },
    Special      = { fg = theme.secondary_accent_med, bg = theme.none, style = "italic" },
    -- Pmenu
    Pmenu        = { fg = theme.main, bg = theme.dark, theme.none },
    PmenuSel     = { fg = theme.dark, bg = theme.main, theme.none },
    PmenuSbar    = { fg = theme.none, bg = theme.main, theme.none },
    PmenuThumb   = { fg = theme.none, bg = theme.none, theme.none },
    -- Status line
    StatusLine   = { fg = theme.main, bg = "#1d000a", style = theme.bold },
    StatusLineNC = { fg = theme.main, bg = theme.black, theme.none },
    -- Tab pages
    TabLine      = { fg = theme.main_hard, bg = theme.none, theme.none },
    TabLineFill  = { fg = theme.none, bg = theme.none, theme.none },
    TabLineSel   = { fg = theme.main_hard, bg = theme.none, theme.none },
    -- Folds
    Folded       = { fg = theme.secondary_accent, bg = theme.none, style = "italic" },
    FoldColumn   = { fg = theme.secondary_accent, bg = theme.none, theme.none },

  }

  set_highlights(highlights)
end

function utils.configure(opts)
  opts = opts or {}
  utils.settings = vim.tbl_deep_extend("force", {}, opts, { theme = "dark" })
end

function utils.setup_theme()
  local theme = colors.get_theme(utils.settings)

  -- clear current highlights
  -- api.nvim_command("highlight clear")

  vim.opt.termguicolors = true

  vim.g.colors_name = "neocyberpunk"

  api.nvim_command("silent! colorscheme neocyberpunk")

  make_editor_highlights(theme, utils.settings)
end

return utils
