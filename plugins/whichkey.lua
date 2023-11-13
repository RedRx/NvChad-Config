return {
  "folke/which-key.nvim",
  config = function()
    local wk = require "which-key"
    wk.register({
      c = {
        name = " CommentBox, 󱌺 Compiler",
      },
      d = {
        name = "󱔗 DevDocs,   Debugger",
        p = {
          name = "  Telescope DAP",
        },
      },
      D = {
        name = "󰕚  DiffView",
      },
      f = {
        name = "󰮗 Find, 󰣟 Format, 󰋗 help",
      },
      g = {
        name = "  Git, Blame, repo",
        g = {
          name = "  LazyGit",
        },
      },
      j = {
        name = "󰘦  JQX",
      },
      l = {
        name = "  Lsp",
      },
      m = {
        name = " Markdown, 󰳾 Multicursors",
      },
      n = {
        name = "  Neogen, Obj-Swap",
      },
      O = {
        name = " Octo",
      },
      p = {
        name = "  Lazy,   Mason, PickHiddenTerm",
      },
      q = {
        name = "󰐃 persistence",
      },
      r = {
        name = "󰑕 Rename, ToggleLine",
      },
      s = {
        name = " Split, 󰙨 SnipRun, 󱐪 Maximizer",
      },
      S = {
        name = "󰗅 Surrounding",
      },
      T = {
        name = "󰈞  Trouble",
      },
      t = {
        name = "󰔎 Themes, 󱌺 Codium, 󰖶 Wrap, Delete",
      },
      w = {
        name = "  Workspace",
      },
      z = {
        name = "  Color",
      },
    }, { prefix = "<leader>" })
  end,
}
