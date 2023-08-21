local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "python", "go", "typescript", "rust", "html",
          "markdown", "bash", "gomod", "svelte" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      })
    end
  },
  {
    "nvim-treesitter/playground",
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        config = function()
          require 'cmp'.setup {
            sources = {
              { name = 'luasnip' },
              -- more sources
            },
          }
        end
      },                          -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
    }


  },
  {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim"
  },
  {
    'L3MON4D3/LuaSnip',
    event = "VeryLazy",
    dependencies = {
      { "honza/vim-snippets" }
    }
  }, -- Required
  { "mbbill/undotree" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "tpope/vim-fugitive" },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  { 'echasnovski/mini.nvim', version = '*' },
  {
    'echasnovski/mini.pairs',
    version = '*'
  }, {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-lualine/lualine.nvim", "nvim-tree/nvim-web-devicons" }
},
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'Wansmer/treesj',
    keys = { '<space>f', '<space>j', '<space>k' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        max_join_length = 22220,
      })
    end,
  },
  { 'APZelos/blamer.nvim' },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
}

local opts = {
  style = "moon"
}

require("lazy").setup(plugins, opts)
