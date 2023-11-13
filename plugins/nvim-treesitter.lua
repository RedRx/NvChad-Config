local overrides = require "custom.configs.overrides"

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "windwp/nvim-ts-autotag" },
    {
      "andymass/vim-matchup",
      init = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 }
      end,
    },
  },
  opts = overrides.treesitter,
}
