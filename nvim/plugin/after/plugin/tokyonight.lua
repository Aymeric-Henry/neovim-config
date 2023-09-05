-- tototoot

require("tokyonight").setup {
  style = "night",
  on_colors = function(colors)
    colors.comment = "#829ce8"
    colors.border_highlight = colors.bg_popup
  end,
  on_highlights = function(hl, c)
    hl.ColorColumn = {
      bg = c.bg_popup,
    }
    hl.LineNr = {
      fg = "#aaaaaa",
    }
    hl.CursorLineNr = {
      fg = c.orange,
    }
    local prompt = c.bg_popup
    hl.TelescopeNormal = {
      bg = c.bg_popup,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = prompt,
      fg = prompt
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_popup,
      fg = c.comment,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_popup,
      fg = c.comment,
    }
    hl.DiagnosticUnnecessary = {
      fg = "#829ce8",
      underline = true
    }
  end,
}

vim.cmd('colorscheme tokyonight')
