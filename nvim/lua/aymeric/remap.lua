vim.g.mapleader = " "

vim.keymap.set("n", "<leader>nn", vim.cmd.Ex)
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)
vim.keymap.set("n", "<leader>t", "<cmd> lua require('treesj').toggle()<CR>")

vim.keymap.set("n", "<leader>b", vim.cmd.bd)
vim.keymap.set("n", "<leader>db", vim.cmd.DBUIToggle)
--
vim.cmd("autocmd FileType sql nnoremap <C-Enter> <Plug>(DBUI_ExecuteQuery)")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S",
  [[:!find . -type f -name "*.ts"| xargs gsed -i -r "s/\<<C-r><C-w>\>/<C-r><C-w>/g" <Left><Left><Left>]])
-- Use <Tab> to cycle through buffers in  tab
vim.keymap.set('n', '<Tab>', '<C-W>w');
vim.keymap.set('n', '<S-Tab>', '<C-W>W');
