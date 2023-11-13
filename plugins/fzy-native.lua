return {
  "nvim-telescope/telescope-fzy-native.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension "fzy_native"
    require("telescope").setup {
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      },
    }
    require("telescope").load_extension "fzy_native"
  end,
}
