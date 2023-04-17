local overrides = require "custom.configs.overrides"

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
    opts = overrides.mason,
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
    "christoomey/vim-tmux-navigator",
    keys = { "<C-h>", "<C-j>", "<C-K>", "<C-l>" },
  },
  -- To make a plugin not be loaded
  { "NvChad/nvim-colorizer.lua" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" }, -- to enable preview (optional)
  {
    "ojroques/nvim-lspfuzzy",
    event = "LspAttach",
    dependencies = {
      { "junegunn/fzf" },
      { "junegunn/fzf.vim" }, -- to enable preview (optional)
    },
    config = function()
      require "custom.configs.lspfuzzy"
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "hrsh7th/vim-eft",
    keys = { ";", "f", "F", "t", "T" },
    config = function()
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
    keys = { "j", "k" },
    config = function()
      vim.cmd [[nmap j <Plug>(accelerated_jk_gj)]]
      vim.cmd [[nmap k <Plug>(accelerated_jk_gk)]]
    end,
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  },
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    dependencies = {
      { "tpope/vim-repeat" },
    },
    config = function()
      require("leap").add_default_mappings()
      -- The below settings make Leap's highlighting closer to what you've been
      -- used to in Lightspeed.
      -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
      vim.api.nvim_set_hl(0, 'LeapMatch', {
      -- For light themes, set to 'black' or similar.
      fg = 'orange', bold = true, nocombine = true,
      })
      -- Of course, specify some nicer shades instead of the default "red" and "blue".
      vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
        fg = 'red', bold = true, nocombine = true,
      })
      vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
        fg = 'blue', bold = true, nocombine = true,
      })
      -- Try it without this setting first, you might find you don't even miss it.
      require('leap').opts.highlight_unlabeled_phase_one_targets = true
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    keys = { "zR", "zM", "zr", "zm" },
    dependencies = {
      { "kevinhwang91/promise-async" },
    },
    config = function()
      require "custom.configs.ufo"
    end,
  },
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      require("trouble").setup {}
    end,
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
  }
}
return plugins
