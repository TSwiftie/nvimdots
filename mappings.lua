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
  },
}

M.undotree = {
  n = {
    ["<leader>ud"] = { "<cmd>UndotreeToggle<CR>", "show undotree", opts = { silent = true, noremap = true }},
  }
}

-- more keybinds!
return M
