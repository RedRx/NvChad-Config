return {
  "goolord/alpha-nvim",
  enabled = true,
  event = "BufWinEnter",
  config = function()
    require "custom.configs.alpha"
  end,
}
