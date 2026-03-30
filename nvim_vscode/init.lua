require("basic") -- Basic Settings
require("keybindings") -- Key Bindings
require("plugins") -- Lazy Plugin Management
-- gui
if vim.g.neovide then
    require("neovide")
end
