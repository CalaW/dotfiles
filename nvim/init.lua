require('basic') -- Basic Settings
require('keybindings') -- Key Bindings
require('plugins') -- Packer Plugin Management
require('colorscheme') -- Color Schene
-- LSP
require('lsp')
require('completion')
require('format')
-- gui
if vim.g.neovide then
    require("neovide")
end
