return {
  "azabiong/vim-highlighter",
  lazy = false, -- Not Lazy by default
  keys = {
    -- These are basing keymaps to guide new users
    { "f<Enter>", desc = "Highlight" },
    { "f<BS>", desc = "Remove Highlight" },
    { "f<C-l>", desc = "Clear Highlight" },
    { "f<Tab>", desc = "Find Highlight (similar to Telescope grep)" },
    -- They are derivated from the default keymaps, see README.md to github repo for documentation
    { "mn", "<cmd>Hi><CR>", desc = "Next Recently Set Highlight" },
    { "mg", "<cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
    { "m[", "<cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
    { "m]", "<cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
  },
}
