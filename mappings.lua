---@type MappingsTable
local M = {}

local function toggle_nvimtree()
  local buf_name = vim.fn.bufname(vim.fn.winbufnr(0))
  if string.find(buf_name, "NvimTree") then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, true, true), "n", true)
  else
    vim.cmd "NvimTreeFocus"
  end
end

local function telescope_lsp_references()
  require("telescope.builtin").lsp_references {
    prompt_title = "LSP References",
    previewer = true,
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "bottom", preview_width = 0.50, results_width = 0.50 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  }
end

local function telescope_lsp_definitions()
  require("telescope.builtin").lsp_definitions {
    prompt_title = "LSP Definitions",
    previewer = true,
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "bottom", preview_width = 0.50, results_width = 0.50 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  }
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gl"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Hover diagnostics",
    },
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
    ["mk"] = { "<cmd>m-2<cr>", "Move Line Up" },
    ["mj"] = { "<cmd>m+1<cr>", "Move Line Down" },
    ["x"] = { '"_x', desc = "Delete one word but not copy" },
    ["c"] = { '"_c', desc = "Delete word but not copy" },
    ["X"] = { '"_X', desc = "Delete one word but not copy" },
    ["C"] = { '"_C', desc = "Delete word but not copy" },

    -- organize imports
    ["<leader>Oi"] = { organize_imports, "Organize TypeScript Imports" },
    ["<leader>wq"] = { "<cmd>:wq<CR>", "Save and Quit" },
    ["<leader>ww"] = { "<cmd>:w<CR>", "Save File" },
    ["<leader>Q"] = { "<cmd>:q!<CR>", "Quit" },
    ["gd"] = {
      telescope_lsp_definitions,
      "LSP definitions",
    },

    ["gr"] = {
      telescope_lsp_references,
      "LSP references",
    },

    ["<leader>ggh"] = {
      "<cmd>:Alpha<CR>",
      "Alpha Dashboard",
    },

    -- Add more of default mapping
    ["<leader>/"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>?"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

    ["<leader>e"] = { "<cmd>:NvimTreeToggle<CR>", "Toggle NvimTree" },
    ["<leader>o"] = { toggle_nvimtree, "Toggle/Focus NvimTree" },
    ["gm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    ["+"] = { "<cmd>vertical resize +1<cr>", desc = "Vertical resize +" },     -- use resize with Ctrl + arrow
    ["_"] = { "<cmd>vertical resize -1<cr>", desc = "Vertical resize -" },
    [")"] = { "<cmd>horizontal resize +1<cr>", desc = "Horizontal resize +" }, -- use resize with Ctrl + arrow
    ["("] = { "<cmd>horizontal resize -1<cr>", desc = "Horizontal resize -" },
    ["<leader>sv"] = { "<cmd>:vsplit<cr>", desc = "Vertical split" },
    ["<leader>sh"] = { "<cmd>:split<cr>", desc = "Horizontal split" },

    ["<leader>tw"] = {
      "<cmd>set wrap!<CR>",
      "Toggle wrap long lines",
    },
    ["<leader>pm"] = { "<cmd>:Mason<cr>", desc = "Mason Package" },
    ["<leader>pa"] = { "<cmd>:Lazy<cr>", desc = "Lazy" },

    ["<leader>li"] = {
      "<cmd>:LspInfo<CR>",
      "LspInfo",
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │     Lazygit                                              │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<leader>ggg"] = { "<cmd>:LazyGit<cr>", desc = "LazyGit" },
    ["<leader>ggc"] = {
      "<cmd>:LazyGitCurrentFile<cr>",
      desc = "LazyGitCurrentFile",
    },
    ["<leader>ggf"] = { "<cmd>:LazyGitFilter<cr>", desc = "LazyGitFilter" },
    ["<leader>ggd"] = {
      "<cmd>:LazyGitFilterCurrentFile<cr>",
      desc = "LazyGitFilterCurrentFile",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ git override default                                     │
    -- ╰──────────────────────────────────────────────────────────╯
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │     Undotree                                             │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<C-u>"] = { "<cmd>UndotreeToggle<cr>", desc = "UndotreeToggle" },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │     Find TodoTelescope                                   │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<leader>ft"] = {
      "<cmd>:TodoTelescope<CR>",
      "Todo Telescope",
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Compiler                                                 │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<leader>co"] = {
      "<cmd>:CompilerOpen<CR>",
      "Open compiler",
    },
    ["<leader>cs"] = {
      "<cmd>:CompilerStop<CR>",
      "Stop compiler",
    },
    ["<leader>ct"] = {
      "<cmd>:CompilerToggleResults<CR>",
      "Toggle Results of compiler",
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ SnipRun                                                  │
    --  ╰──────────────────────────────────────────────────────────╯
    -- -- NOTE: For michaelb/sniprun
    -- -- PERF: SnipRun must manual in Vistual mode and select code
    ["<leader>sc"] = {
      "<cmd>:SnipClose<CR>",
      "Deactivate SnipRun",
    },
    ["<leader>si"] = {
      "<cmd>:SnipInfo<CR>",
      "Info of SnipRun",
    },
    ["<leader>sC"] = {
      "<cmd>:SnipReplMemoryClean<CR>",
      "Clean memory of SnipRun",
    },
    ["<leader>sr"] = {
      "<cmd>:SnipRun<CR>",
      "SnipRun",
    },
    ["<leader>se"] = {
      "<cmd>:SnipReset<CR>",
      "Reset SnipRun",
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Diffview                                                 │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<leader>Do"] = {
      "<cmd>:DiffviewOpen<CR>",
      "DiffviewOpen",
    },
    ["<leader>Dc"] = {
      "<cmd>:DiffviewClose<CR>",
      "DiffviewClose",
    },
    ["<leader>Dl"] = {
      "<cmd>:DiffviewLog<CR>",
      "DiffviewLog",
    },
    ["<leader>Dr"] = {
      "<cmd>:DiffviewRefresh<CR>",
      "DiffviewRefresh",
    },
    ["<leader>Df"] = {
      "<cmd>:DiffviewFileHistory<CR>",
      "DiffviewFileHistory",
    },
    ["<leader>DF"] = {
      "<cmd>:DiffviewFousFiles<CR>",
      "DiffviewFousFiles",
    },
    ["<leader>Dt"] = {
      "<cmd>:DiffviewToggleFiles<CR>",
      "DiffviewToggleFiles",
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │     Twilight                                             │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<HOME><HOME>"] = {
      "<cmd>Twilight<cr>",
      desc = "Twilight Code Color",
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │     MarkdownPreview                                      │
    --  ╰──────────────────────────────────────────────────────────╯
    ["<leader>mp"] = { "<cmd>:MarkdownPreview<CR>", "MarkdownPreview" },
  },
  i = {
    ["<C-v>"] = { '<C-o>"+p', "Paste In InsertMode" },
    ["<C-c>"] = { '<C-o>"+y', "Copy In InsertMode" },
    ["jj"] = { "<esc>" },
    ["jk"] = { "<esc>" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>S"] = { "<Plug>VSurround" },
  },
  t = {},
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-pagedown>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<C-pageup>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-home>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-pagedown>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<C-pageup>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-home>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    -- ["<leader>h"] = {
    --   function()
    --     require("nvterm.terminal").new "horizontal"
    --   end,
    --   "New horizontal term",
    -- },
    --
    -- ["<leader>v"] = {
    --   function()
    --     require("nvterm.terminal").new "vertical"
    --   end,
    --   "New vertical term",
    -- },
  },
}

return M
