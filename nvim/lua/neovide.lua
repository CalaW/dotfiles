local map = vim.keymap.set
local opt = {noremap = true, silent = true}

vim.opt.guifont = {"MonoLisa", ":h16"}
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_remember_window_size = false
vim.g.neovide_input_use_logo = true -- forward command key
-- vim.g.neovide_input_macos_alt_is_meta = true -- forward alt

map('n', '<D-s>', ':w<CR>') -- Save
map('v', '<D-c>', '"+y') -- Copy
map('n', '<D-v>', '"+P') -- Paste normal mode
map('v', '<D-v>', '"+P') -- Paste visual mode
map('c', '<D-v>', '<C-R>+') -- Paste command mode
map('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Allow clipboard copy paste in neovim
map('', '<D-v>', '+p<CR>', opt)
map('!', '<D-v>', '<C-R>+', opt)
map('t', '<D-v>', '<C-R>+', opt)
map('v', '<D-v>', '<C-R>+', opt)
