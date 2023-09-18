local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ng', builtin.git_files, {})
vim.keymap.set('n', '<leader>ns', function()
  local current_word = vim.call('expand', '<cword>')
  builtin.grep_string({ search = vim.fn.input("Grep > ", current_word) })
end)

vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


vim.keymap.set('n', '<leader>nb', builtin.buffers, {})
vim.keymap.set('n', '<leader>nk', ":bprevious<CR>")
vim.keymap.set('n', '<leader>nj', ":bnext<CR>")

require("telescope").load_extension('harpoon')
require('telescope').load_extension('fzf')
