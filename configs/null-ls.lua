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

local sources = {
  -- FORMAT
  -- webdev stuff
  b.formatting.deno_fmt, -- chosen deno for ts/js files because it's very fast!
  b.formatting.rustywind, -- tailwind
  b.formatting.yamlfmt, -- yaml
  b.formatting.yamlfix, -- yaml
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
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

  -- Add the sources from your first config
  -- Feel free to remove any duplicates
  -- b.diagnostics.luacheck,
  -- b.diagnostics.selene,
  b.diagnostics.yamllint,
  b.diagnostics.jsonlint,
  b.diagnostics.markuplint,
  b.diagnostics.sqlfluff,

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
}
