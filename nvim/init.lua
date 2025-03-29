require("basic") -- Basic Settings
require("keybindings") -- Key Bindings
require("plugins") -- Lazy Plugin Management
-- LSP
if not vim.g.vscode then
	require("lsp")
	require("completion")
	require("format")
end
-- gui
if vim.g.neovide then
	require("neovide")
end
