return {
  "echasnovski/mini.move",
  config = function(_, opts)
    require("mini.move").setup(opts)
  end,
  keys = {
    { "<C-l>", mode = { "v" } },
    { "<C-k>", mode = { "v" } },
    { "<C-j>", mode = { "v" } },
    { "<C-h>", mode = { "v" } },
  },
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Clt (Meta) + hjkl.
      left = "<C-h>",
      right = "<C-l>",
      down = "<C-j>",
      up = "<C-k>",
      -- Move current line in Normal mode
      -- line_left = "<M-h>",
      -- line_right = "<M-l>",
      -- line_down = "<M-j>",
      -- line_up = "<M-k>",
    },
  },
}
