-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  green  = "#aef359",
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal   = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },
  command  = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert   = { a = { fg = colors.black, bg = colors.blue } },
  visual   = { a = { fg = colors.black, bg = colors.cyan } },
  replace  = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}



local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
  },
  sections = {
    lualine_a = { { 'mode', right_padding = 2 } },
    lualine_b = { 'filename', { 'filename', path = 1 } },
    lualine_c = {},
    lualine_x = {
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        fmt = show_macro_recording,
        color = { fg = colors.red },
      },
      { 'diagnostics' },
    },
    lualine_y = { 'branch', 'diff', 'progress' },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
