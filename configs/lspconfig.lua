local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "bashls",
  "tsserver",
  "clangd",
  "tailwindcss",
  "cssmodules_ls",
  "emmet_ls",
  "emmet_language_server",
  "jsonls",
  "eslint",
  -- "vtsls",
  "dockerls",
  "sqlls",
  "yamlls",
  "graphql",
  "spectral",
  "docker_compose_language_service",
  "prismals",
  "vimls",
  "remark_ls",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      typeScript = {
        unusedLocals = "error",
        unusedParameters = "error",
      },
      javascript = {
        unusedLocals = "error",
        unusedParameters = "error",
      },
    },
  }
end

--
-- lspconfig.pyright.setup { blabla}
