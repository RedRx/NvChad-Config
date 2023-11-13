vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#D19A66 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guifg=#56B6C2 gui=nocombine]]

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    char = "┃",
    show_trailing_blankline_indent = true,
  },
  config = function()
    require("indent_blankline").setup {
      space_char_blankline = " ",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
        "IndentBlanklineIndent7",
      },
      show_current_context = true,
      show_current_context_start = true,
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "nvim-tree" },
      },
      whitespace = {
        remove_blankline_trail = true,
      },
    }
  end,
}
