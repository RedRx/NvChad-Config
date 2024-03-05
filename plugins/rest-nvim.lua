local prefix = "<leader>R"

return {
  {
    "rest-nvim/rest.nvim",
    ft = {
      "http",
      -- "json"
    },
    cmd = {
      "RestNvim",
      "RestNvimPreview",
      "RestNvimLast",
    },
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
      { prefix,        desc = "RestNvim" },
      { prefix .. "r", "<Plug>RestNvim", desc = "Run request" },
    },
    opts = {},
  },
}
