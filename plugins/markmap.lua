return {
  "Zeioth/markmap.nvim",
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  opts = {
    hide_toolbar = "false",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
  },
}
