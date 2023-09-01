local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        asmdecl = false,
        cgocall = false,
        lostcancel = false,
        nilness = true,
      }
    }
  }
}


-- 
-- lspconfig.pyright.setup { blabla}
