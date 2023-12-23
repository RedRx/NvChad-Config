local null_ls = require "null-ls"

local b = null_ls.builtins

-- Define an autocmd group
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

-- Customize the diagnostics messages
local function custom_publish_diagnostics(err, result, ctx, config)
  if err ~= nil then
    return
  end

  if result == nil then
    return
  end

  local diagnostics = result.diagnostics

  for _, diagnostic in ipairs(diagnostics) do
    diagnostic.message = string.format("%s [%s]", diagnostic.message, diagnostic.source or "unknown")
  end

  vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
end

local sources = {
  -- FORMAT
  -- webdev stuff
  b.formatting.deno_fmt, -- chosen deno for ts/js files because it's very fast!
  b.formatting.rustywind, -- tailwind
  b.formatting.yamlfmt, -- yaml
  b.formatting.yamlfix, -- yaml
  b.formatting.prettier,
  b.formatting.prettierd,

  -- Lua
  b.formatting.stylua,

  -- Json
  b.formatting.fixjson,

  -- cpp
  b.formatting.clang_format,

  -- sql
  b.formatting.sql_formatter,

  -- DIAGNOSTICS
  b.diagnostics.eslint,
  b.diagnostics.hadolint, -- docker
  b.diagnostics.selene,
  b.diagnostics.yamllint,
  b.diagnostics.jsonlint,
  b.diagnostics.markuplint,
  b.diagnostics.sqlfluff,

  -- Add more formatting if needed
  b.formatting.clang_format,
  b.formatting.sql_formatter,
  b.formatting.cbfmt,
  b.formatting.rustywind,
  b.formatting.beautysh,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = custom_publish_diagnostics,
  },
}
