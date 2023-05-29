local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "clangd", "cmake", "verible" }

for _, lsp in ipairs(servers) do
  if lsp == 'clangd' then
    local clangd_capabilities = capabilities
    clangd_capabilities.offsetEncoding = { "utf-16" }
    local lsp_options = require("clangd_extensions").prepare {
      server = {
        on_attach = on_attach,
        capabilities = clangd_capabilities,
        single_file_support = true,
        cmd = {
          "clangd",
          "--background-index",
          "--pch-storage=memory",
			    "--clang-tidy",
			    "--all-scopes-completion",
			    "--completion-style=detailed",
			    "--header-insertion-decorators",
			    "--header-insertion=never",
          "--limit-references=0",
          "--limit-results=0",
		    },
      },
    }
    lspconfig[lsp].setup {
      on_attach = lsp_options.on_attach,
      capabilities = lsp_options.capabilities,
      single_file_support = lsp_options.single_file_support,
      cmd = lsp_options.cmd,
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

-- lspconfig.pyright.setup { blabla}
