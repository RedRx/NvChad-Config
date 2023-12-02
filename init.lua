-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local opt = vim.opt
local g = vim.g
local o = vim.o
local keymap = vim.keymap

--  ╭──────────────────────────────────────────────────────────╮
--  │ NOTE: OPT Setting                                        │
--  ╰──────────────────────────────────────────────────────────╯
opt.iskeyword:append "-" -- Append word when delete or select hello-Hello <- will select all these words
opt.iskeyword:append "_" -- Append word when delete or select hello-Hello <- will select all these words
opt.wildignore:append { "*/node_modules/*" }
opt.termguicolors = true
opt.wrap = true
opt.showcmd = true
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.ignorecase = true
opt.smarttab = true

--  ╭──────────────────────────────────────────────────────────╮
--  │ NOTE: G Setting                                           │
--  ╰──────────────────────────────────────────────────────────╯
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.set_encoding = "utf-8"

--  ╭──────────────────────────────────────────────────────────╮
--  │ NOTE: O Setting                                           │
--  ╰──────────────────────────────────────────────────────────╯
o.clipboard = "unnamedplus"

--  ╭──────────────────────────────────────────────────────────╮
--  │ NOTE: Keymap setting                                     │
--  ╰──────────────────────────────────────────────────────────╯
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "dw", "diw")

--
--  ╭──────────────────────────────────────────────────────────╮
--  │ NOTE: Neovide Settings                                   │
--  ╰──────────────────────────────────────────────────────────╯
if g.neovide then
  o.guifont = "CaskaydiaCove Nerd Font:h16"
  g.set_encoding = "utf-8"
  opt.linespace = 0
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0

  g.neovide_scroll_animation_length = 0.3
  g.neovide_hide_mouse_when_typing = true
  g.neovide_underline_automatic_scaling = false
  g.neovide_theme = "auto"
  g.neovide_refresh_rate = 60
  g.neovide_refresh_rate_idle = 5
  g.neovide_no_idle = true
  g.neovide_confirm_quit = true
  g.neovide_fullscreen = true
  g.neovide_remember_window_size = true
  -- g.neovide_cursor_animation_length = 0.13
  g.neovide_cursor_trail_size = 0.7 -- Default is 0.8
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_animate_command_line = true
  -- g.neovide_cursor_unfocused_outline_width = 0.125

  -- g.neovide_cursor_vfx_mode = "railgun"
  -- g.neovide_cursor_vfx_mode = "torpedo"
  g.neovide_cursor_vfx_mode = "pixiedust"
  -- g.neovide_cursor_vfx_mode = "sonicboom"
  -- g.neovide_cursor_vfx_mode = "ripple"
  -- g.neovide_cursor_vfx_mode = "wireframe"
  --
  g.neovide_cursor_vfx_opacity = 200.0
  g.neovide_cursor_vfx_particle_lifetime = 2.0 -- Default is 1.2
  g.neovide_cursor_vfx_particle_density = 20.0 -- Default is 7.0
  g.neovide_cursor_vfx_particle_speed = 10.0 -- Default is 10.0

  -- g.neovide_cursor_vfx_particle_phase = 1.5 -- Only for the railgun vfx mode.
  -- g.neovide_cursor_vfx_particle_curl = 1.0 -- Only for the railgun vfx mode.

  -- Transparency
  -- Helper function for transparency formatting
  -- local alpha = function() return string.format("%x", math.floor(255 * 0.85)) end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- g.neovide_transparency = 0.85
  -- g.transparency = 0.85
  -- g.neovide_background_color = "#0f1117" .. alpha()
  -- g.neovide_background_color = "#000000" .. alpha()
  -- alpha()
  g.neovide_background_color = "#000000"
  g.neovide_floating_blur_amount_x = 2.0
  g.neovide_floating_blur_amount_y = 2.0
end

--  ╭──────────────────────────────────────────────────────────╮
--  │ NOTE:  TO FIX win32yank                                  │
--  ╰──────────────────────────────────────────────────────────╯
--  ╭──────────────────────────────────────────────────────────╮
--  │ TODO: add shortcut for use win32yank from windowssudo    │
--  ╰──────────────────────────────────────────────────────────╯
-- $ sudo ln -s /mnt/c/Users/<username>/scoop/apps/neovim/current/bin/win32yank.exe /usr/local/bin/win32yank.exe
--
-- g.clipboard = {
--   name = "win32yank-wsl",
--   copy = {
--     ["+"] = "win32yank.exe -i --crlf",
--     ["*"] = "win32yank.exe -i --crlf",
--   },
--   paste = {
--     ["+"] = "win32yank.exe -o --crlf",
--     ["*"] = "win32yank.exe -o --crlf",
--   },
--   cache_enable = 0,
-- }
--
