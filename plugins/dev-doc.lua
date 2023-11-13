local prefix = "<leader>d"

return {
  {
    "luckasRanarison/nvim-devdocs",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    },
    keys = {
      { prefix .. "d", "<cmd>DevdocsOpenCurrentFloat<CR>", desc = "Find Devdocs for current file", mode = { "n" } },
      { prefix .. "D", "<cmd>DevdocsOpenFloat<CR>", desc = "Find Devdocs", mode = { "n" } },
    },
    opts = {
      previewer_cmd = vim.fn.executable "glow" == 1 and "glow" or nil,
      cmd_args = { "-s", "dark", "-w", "80" },
      picker_cmd = true,
      picker_cmd_args = { "-p" },
    },
  },

  vim.api.nvim_set_keymap("n", "<leader>di", "<cmd>:DevdocsInstall<CR>", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>:DevdocsFetch<CR>", { noremap = true, silent = true }),
}
