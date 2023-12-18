return {
  "rcarriga/nvim-notify",
  opts = {
    stages = "fade_in_slide_out", -- fade, slice, static, fade_in_slide_out
    timeout = 2000, -- default is 3000
    background_colour = "#000000",
    render = "compact", -- default, compact, simple, minimal
  },
  event = "VeryLazy",
  config = function(_, opts)
    local notify = require "notify"
    notify.setup(opts)

    notify.extension = {
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        HINT = "",
      },
    }
    vim.api.nvim_set_keymap("n", "<leader>un", "<cmd>Notify<CR>", { noremap = true, silent = true })
    vim.notify = notify
  end,
}
