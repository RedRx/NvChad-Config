local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local board = {
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "██████╗ ███████╗ █████╗ ██████╗ ██╗   ██╗██████╗ ███████╗██╗   ██╗",
  "██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗██╔════╝██║   ██║",
  "██████╔╝█████╗  ███████║██████╔╝ ╚████╔╝ ██║  ██║█████╗  ██║   ██║",
  "██╔══██╗██╔══╝  ██╔══██║██╔══██╗  ╚██╔╝  ██║  ██║██╔══╝  ╚██╗ ██╔╝",
  "██████╔╝███████╗██║  ██║██║  ██║   ██║   ██████╔╝███████╗ ╚████╔╝ ",
  "╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚══════╝  ╚═══╝  ",
  -- --
  --
  -- "████████╗ ██████╗ ██╗   ██╗██╗      █████╗ ██████╗       ██████╗ ███████╗██╗   ██╗",
  -- "╚══██╔══╝██╔═══██╗╚██╗ ██╔╝██║     ██╔══██╗██╔══██╗      ██╔══██╗██╔════╝██║   ██║",
  -- "   ██║   ██║   ██║ ╚████╔╝ ██║     ███████║██████╔╝█████╗██║  ██║█████╗  ██║   ██║",
  -- "   ██║   ██║   ██║  ╚██╔╝  ██║     ██╔══██║██╔══██╗╚════╝██║  ██║██╔══╝  ╚██╗ ██╔╝",
  -- "   ██║   ╚██████╔╝   ██║   ███████╗██║  ██║██████╔╝      ██████╔╝███████╗ ╚████╔╝ ",
  -- "   ╚═╝    ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═════╝       ╚═════╝ ╚══════╝  ╚═══╝  ",
  -- --
  --
  --
  -- "d888888b  .d88b.  db    db db       .d8b.  d8888b.        d8888b. d88888b db    db ",
  -- "`~~88~~' .8P  Y8. `8b  d8' 88      d8' `8b 88  `8D        88  `8D 88'     88    88 ",
  -- "   88    88    88  `8bd8'  88      88ooo88 88oooY'        88   88 88ooooo Y8    8P ",
  -- "   88    88    88    88    88      88~~~88 88~~~b. C8888D 88   88 88~~~~~ `8b  d8' ",
  -- "   88    `8b  d8'    88    88booo. 88   88 88   8D        88  .8D 88.      `8bd8'  ",
  -- "   YP     `Y88P'     YP    Y88888P YP   YP Y8888P'        Y8888D' Y88888P    YP    ",
  --
  --
  -- --
  -- "8 888888888o.   8 8888888888   8 888888888o.      8 888888888o.   `8.`8888.      ,8' ",
  -- "8 8888    `88.  8 8888         8 8888    `^888.   8 8888    `88.   `8.`8888.    ,8'  ",
  -- "8 8888     `88  8 8888         8 8888        `88. 8 8888     `88    `8.`8888.  ,8'   ",
  -- "8 8888     ,88  8 8888         8 8888         `88 8 8888     ,88     `8.`8888.,8'    ",
  -- "8 8888.   ,88'  8 888888888888 8 8888          88 8 8888.   ,88'      `8.`88888'     ",
  -- "8 888888888P'   8 8888         8 8888          88 8 888888888P'       .88.`8888.     ",
  -- "8 8888`8b       8 8888         8 8888         ,88 8 8888`8b          .8'`8.`8888.    ",
  -- "8 8888 `8b.     8 8888         8 8888        ,88' 8 8888 `8b.       .8'  `8.`8888.   ",
  -- "8 8888   `8b.   8 8888         8 8888    ,o88P'   8 8888   `8b.    .8'    `8.`8888.  ",
  -- "8 8888     `88. 8 888888888888 8 888888888P'      8 8888     `88. .8'      `8.`8888. ",
  --
  --
  --
  -- "                                                                             @###@",
  -- "                                                                        @#+++-=*--*@",
  -- "                                                                       @==+#+-=+-:.-@",
  -- "       @**********##******#%*****#@%*****%*+****@@@@@@*+***+%@@********=:+##+=::::-*@",
  -- "      @++@@@@@@@@=-#%@@@@@#=:#@@%--+%@%=--:%@@#.:+@@@*-%@@@=.+*-@@@@@@@%*:--..::+%@",
  -- "      @*==*@@@*+++@@@%==#@@@=-@@@%+@@#=--:=@@@+::-@@*-@@@@@#:::*@@@=-*@@@-::==+@",
  -- "       @%-*@@@---@@@@=-:+@@@*:=@@@@@+---=:#@@@-::*@*-@@*=@@@:::%@@@%@@@#=::.#@",
  -- "        @=%@@#--=@@@%:--%@@@=--#@@@=---*%-@@@*.:.##-@@@#%@@@=.=@@@+=+@@%=::+@",
  -- "       @#=@@@+---*@@@#*%@@@+---@@@#---#@*=@@@%###*-@@@*##@@@#.*@@@***@@@*::+@",
  -- "       @++%%%---**+*%@@@%*=---=%%%+--=@@-+%%%%%%%**%#-.:.+%%#:#%%%%%%%#=::.=@",
  -- "       @%*------@@@*=----:--+%#=----:*@@%=:::::.::::::::#+:::::::::::...::+@",
  -- "      @%%@#****#%%%%%******#%%%#*#**#%%%%%#************#%%#**********###%@",
  -- "",
  -- "",
  -- "",
  -- "",
}

local data_exists, custom_dasboard = pcall(require, "core.config")
if data_exists then
  local data_board = custom_dasboard.header2
  if data_board ~= nil then
    board = data_board
  end
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = board
dashboard.section.buttons.val = {
  -- dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  -- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  -- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  -- dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  -- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  -- dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
  -- dashboard.button("z", "鈴 Lazy", ":Lazy<CR>"),
  -- dashboard.button("q", "  Quit Neovim", ":qa<CR>")
}

local function footer()
  local footer_text =
    "Company: TOYLAB Co.,Ltd\n \n \n<Info> \nDeveloper: Teerapat Wassavanich \nGitHub: https://github.com/RedRx\nEmail: teerapat.tech@gmail.com\nIDE: Neovim with NvChad & VsCodeVim\nRole: Software Developer, CED"
  if data_exists then
    local data_txt = custom_dasboard.footer
    if data_txt ~= nil then
      footer_text = data_txt
    end
  end

  return footer_text
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- Disable statusline in dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    -- store current statusline value and use that
    local old_laststatus = vim.opt.laststatus
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.laststatus = old_laststatus
      end,
    })
    vim.opt.laststatus = 0
  end,
})
