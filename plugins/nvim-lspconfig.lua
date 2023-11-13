return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- format & linting
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      opts = {
        hint_enable = false, -- disable hints as it will crash in some terminal
      },
    },
  },
  config = function()
    -- require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end, -- Override to setup mason-lspconfig
}
