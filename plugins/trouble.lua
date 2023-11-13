local prefix = "<leader>T"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱍼 " or ""
maps.n[prefix] = { desc = icon .. "Trouble" }
return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { prefix .. "W", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { prefix .. "D", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { prefix .. "L", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { prefix .. "Q", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then
        opts.bottom = {}
      end
      table.insert(opts.bottom, "Trouble")
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { lsp_trouble = true } },
  },
}
