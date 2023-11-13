return {
  "almo7aya/openingh.nvim",
  cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
  keys = {
    {
      "<leader>go",
      "<cmd>OpenInGHRepo<CR>",
      desc = "Open git repo in web",
      mode = { "n" },
    },
    {
      "<leader>gf",
      "<cmd>OpenInGHFile<CR>",
      desc = "Open git file in web",
      mode = { "n" },
    },
  },
}
