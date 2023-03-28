local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},  -- to enable preview (optional)
  {
    'ojroques/nvim-lspfuzzy',
    lazy = false,
    dependencies = {
      {'junegunn/fzf'},
      {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
    config = function ()
      require "custom.configs.lspfuzzy"
    end
  },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "hrsh7th/vim-eft",
    lazy = false,
    config = function ()
      vim.cmd [[nmap ; <Plug>(eft-repeat)]]
      vim.cmd [[xmap ; <Plug>(eft-repeat)]]
      vim.cmd [[nmap f <Plug>(eft-f)]]
      vim.cmd [[xmap f <Plug>(eft-f)]]
      vim.cmd [[omap f <Plug>(eft-f)]]
      vim.cmd [[nmap F <Plug>(eft-F)]]
      vim.cmd [[xmap F <Plug>(eft-F)]]
      vim.cmd [[omap F <Plug>(eft-F)]]
      vim.cmd [[nmap t <Plug>(eft-t)]]
      vim.cmd [[xmap t <Plug>(eft-t)]]
      vim.cmd [[omap t <Plug>(eft-t)]]
      vim.cmd [[nmap T <Plug>(eft-T)]]
      vim.cmd [[xmap T <Plug>(eft-T)]]
      vim.cmd [[omap T <Plug>(eft-T)]]
    end,
  },
  {
    "rhysd/accelerated-jk",
    lazy = false,
    config = function ()
      vim.cmd [[nmap j <Plug>(accelerated_jk_gj)zz]]
      vim.cmd [[nmap k <Plug>(accelerated_jk_gk)zz]]
    end,
  },
  {
    "mbbill/undotree",
    lazy = false,
  }
}
return plugins
