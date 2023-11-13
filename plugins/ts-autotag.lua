return {
  "windwp/nvim-ts-autotag",
  event = "BufRead",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
