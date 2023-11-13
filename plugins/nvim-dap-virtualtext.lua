return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  opts = {
    commented = true,
    enabled = true,
    enabled_commands = true,
  },
}
