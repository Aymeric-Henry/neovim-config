require("aymeric")

vim.cmd('colorscheme tokyonight-night')
-- reset the line color as something more readable
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#aaaaaa" })
