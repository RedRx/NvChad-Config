--  ╭──────────────────────────────────────────────────────────╮
--  │ Vim plugin for automatically highlighting other          │
--  │  uses of the word under the cursor using either          │
--  │  LSP, Tree-sitter, or regex matching.                    │
--  ╰──────────────────────────────────────────────────────────╯
return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
      "NvimTree",
      "Trouble",
      "Outline",
      "TelescopePrompt",
      "Empty",
      "dirvish",
      "fugitive",
      "alpha",
      "packer",
      "neogitstatus",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "aerial",
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
    -- See `:help mode()` for possible values
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
    -- should_enable: a callback that overrides all other settings to
    -- enable/disable illumination. This will be called a lot so don't do
    -- anything expensive in it.
    max_file_lines = nil,
    should_enable = function(bufnr)
      if vim.bo[bufnr].filetype == "NvimTree" then
        return false -- Disable illumination for NvimTree
      end
      return true
    end,
    -- case_insensitive_regex: sets regex case sensitivity
    case_insensitive_regex = false,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
    local highlights = {
      IlluminatedWord = { bg = "#324884" },
      IlluminatedCurWord = { bg = "#324884" },
      IlluminatedWordText = { bg = "#324884" },
      IlluminatedWordRead = { bg = "#324884" },
      IlluminatedWordWrite = { bg = "#324884" },
      -- IlluminatedWord = { bg = "#f18501" },
      -- IlluminatedCurWord = { bg = "#f18501" },
      -- IlluminatedWordText = { bg = "#f18501" },
      -- IlluminatedWordRead = { bg = "#f18501" },
      -- IlluminatedWordWrite = { bg = "#f18501" },
      -- IlluminatedWord = { bg = "#ff7f50" },
      -- IlluminatedCurWord = { bg = "#ff7f50" },
      -- IlluminatedWordText = { bg = "#ff7f50" },
      -- IlluminatedWordRead = { bg = "#ff7f50" },
      -- IlluminatedWordWrite = { bg = "#ff7f50" },
      -- IlluminatedWord = { bg = "#fbceb1" },
      -- IlluminatedCurWord = { bg = "#fbceb1" },
      -- IlluminatedWordText = { bg = "#fbceb1" },
      -- IlluminatedWordRead = { bg = "#fbceb1" },
      -- IlluminatedWordWrite = { bg = "#fbceb1" },
    }

    for group, value in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, value)
    end
  end,
}
