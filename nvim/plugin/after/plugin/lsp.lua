local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'lua_ls',
  'eslint',
  'biome',
  'jsonls',
  'svelte',
  'tailwindcss',
  'gopls',
  'html',
  'ruby_lsp',
  'angularls',
  "sqlls"
})

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>qf', quickfix, { noremap = true, silent = true })
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["gopls"] = { 'go' },
    ['lua_ls'] = { 'lua' },
    ['biome'] = { 'javascript', 'typescript' },
    ['eslint'] = { 'javascript', 'typescript', 'angular' },
    ['json'] = { 'jsonls' },
    ['svelte'] = { 'svelte' },
    ['html'] = { 'html' },
    ['sqlls'] = { 'sql' },
    ['angularls'] = { 'html', 'typescript' },
  }
})

lsp.setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_action = require('lsp-zero').cmp_action()
require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets" })

cmp.setup({
  sources = {
    { name = "luasnip",               priority = 1 },
    { name = 'nvim_lsp',              priority = 2 },
    { name = 'path',                  priority = 3 },
    { name = "vim-dadbod-completion", priority = 4 },
    { name = 'buffer',                priority = 5 },
  },
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
});
