-- leader <space> or ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- Marcos
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- indent in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- move lines with J/K
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- doesn't yank an empty line into your default register:
map("n", "dd", function()
	-- vim.notify("custom dd")
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return [["_dd]]
	else
		return "dd"
	end
end, { expr = true })

-- Another expression mapping for i that will indent properly on empty lines:
map("n", "i", function()
	-- vim.notify("custom i")
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })

-- commentary in vscode
if vim.g.vscode then
	map("x", "gc", "<Cmd>call VSCodeCall('editor.action.commentLine')<CR><Esc>")
	map("n", "gc", "<Cmd>call VSCodeCall('editor.action.commentLine')<CR><Esc>")
	map("o", "gc", "<Cmd>call VSCodeCall('editor.action.commentLine')<CR><Esc>")
	map("n", "gcc", "<Cmd>call VSCodeCall('editor.action.commentLine')<CR><Esc>")
end
