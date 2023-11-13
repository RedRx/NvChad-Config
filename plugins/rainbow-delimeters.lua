---@type NvPluginSpec
local spec = {
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { rainbow_delimiters = true } },
  },
}

return spec
