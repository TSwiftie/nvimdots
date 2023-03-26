local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "markdown",
    "markdown_inline",
    "cpp",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    hide_root_folder = false,
    adaptive_size = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
