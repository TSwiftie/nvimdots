---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- ["j"] = { "jzz", "", opts = { noremap = true, silent = true } },
    -- ["k"] = { "kzz", "", opts = { noremap = true, silent = true } },
  },
}

M.lspsaga = {
  n = {
    ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek_definition", opts = { silent = true } },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action", opts = { silent = true } },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover_doc", opts = { silent = true } },
    ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show_line_diagnostics", opts = { silent = true } },
    ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "show_buf_diagnostics", opts = { silent = true } },
    ["<leader>sw"] = {
      "<cmd>Lspsaga show_workspace_diagnostics<CR>",
      "show_workspace_diagnostics",
      opts = { silent = true },
    },
    ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "show_cursor_diagnostics", opts = { silent = true } },
    ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "diagnostic_jump_prev", opts = { silent = true } },
    ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "diagnostic_jump_next", opts = { silent = true } },
  },
  v = {
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action", opts = { silent = true } },
  },
}

M.undotree = {
  n = {
    ["<leader>ud"] = { "<cmd>UndotreeToggle<CR>", "show undotree", opts = { silent = true, noremap = true } },
  },
}

M.lazygit = {
  n = {
    ["<leader>lg"] = { "<cmd>LazyGit<CR>", "lazygit", opts = { silent = true, noremap = true } },
  },
}

M.lspconfig = {
  v = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
  },
}

M.ufo = {
  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "openAllFolds",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "closeAllFolds",
    },
    ["zr"] = {
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      "openFoldsExceptKinds",
    },
    ["zm"] = {
      function()
        require("ufo").closeFoldsWith()
      end,
      "closeFoldsWith",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "TroubleToggle", opts = { silent = true, noremap = true } },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", opts = { silent = true, noremap = true } },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", opts = { silent = true, noremap = true } },
  },
}

-- more keybinds!
return M
