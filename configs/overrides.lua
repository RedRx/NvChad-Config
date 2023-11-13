local M = {}

M.treesitter = {
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  matchup = { enable = true },

  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
    "yaml",
    "html",
    "scss",
    "json",
    "json5",
    "jsdoc",
    "prisma",
    "sql",
    "graphql",
    "bash",
    "dockerfile",
    "gitignore",
    "query",
    "http",
    "graphql",
    "gitcommit",
    "gitignore",
    "regex",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "htmlbeautifier",
    "typescript-language-server",
    "deno",
    "prettier",
    "ts-standard",
    "cssmodules-language-server",
    "sonarlint-language-server",
    "emmet-language-server",
    "emmet-ls",
    "tailwindcss-language-server",
    "json-lsp",
    "jsonlint",
    "eslint-lsp",
    "js-debug-adapter",
    "node-debug2-adapter",
    "graphql-language-service-cli",
    "spectral-language-server",
    "chrome-debug-adapter",
    "vtsls",
    "rustywind",

    -- json
    "cfn-lint",
    "fixjson",
    "json-lsp",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- Docker
    "dockerfile-language-server",
    "docker-compose-language-service",
    "hadolint",

    -- Yaml
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- Others
    "nginx-language-server",
    "beautysh",
    "vim-language-server",

    -- SQL
    "prisma-language-server",
    "sql-formatter",
    "sqlfluff",
    "sqlls",
    "sqlfmt",
  },
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = { enable = true },
  actions = { open_file = { quit_on_open = true } }, -- NOTE: close when open file
  view = {
    width = 40,
    side = "left",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 40,
        height = 40,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    highlight_git = true,
    icons = { show = { git = true } },
    add_trailing = true,
    highlight_diagnostics = true,
  },
  filters = {
    git_ignored = true,
    dotfiles = true,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {
      --  ╭──────────────────────────────────────────────────────────╮
      --  │ all files is not hidden                                  │
      --  ╰──────────────────────────────────────────────────────────╯
      ".",

      --  ╭──────────────────────────────────────────────────────────╮
      --  │       Specific                                           │
      --  ╰──────────────────────────────────────────────────────────╯
      -- ".DS_Store",
      -- ".git",
      -- "node_modules",
      -- ".cache",
      -- ".env",
      -- ".gitignore",
      -- "package-lock.json",
      -- "yarn.lock",
      -- "pnpm-lock.yaml",
      -- "yarn-error.log",
      -- "yarn-debug.log",
      -- "npm-debug.log",
    },
  },
  sort_by = "case_sensitive",
}
return M
