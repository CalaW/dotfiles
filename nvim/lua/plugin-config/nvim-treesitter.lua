local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("Did not find plugin: nvim-treesitter")
	return
end

treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = {
		"json",
		"html",
		"vim",
		"lua",
		"latex",
		"c",
		"python",
		"cpp",
		"markdown",
		"markdown_inline",
		"kdl",
	},
	highlight = {
		enable = not vim.g.vscode,
        disable = {"latex"},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	-- incremental_selection = {
	--     enable = true,
	--     keymaps = {
	--         init_selection = "<CR>",
	--         node_incremental = "<CR>",
	--         node_decremental = "<BS>",
	--         scope_incremental = "<TAB>",
	--     },
	-- },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Disable folding at startup
