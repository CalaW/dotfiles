local status, surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("nvim-surround not found")
	return
end

surround.setup({
	surrounds = {
		-- disable literal surround
		invalid_key_behavior = false,
	},
	aliases = {
		["p"] = ")",
		["b"] = "]",
		["r"] = false,
	},
	move_cursor = false,
	indent_lines = false,
	-- https://github.com/ggandor/leap.nvim/discussions/59
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "gs",
		normal_cur = "gss",
		normal_line = "gS",
		normal_cur_line = "gSS",
		visual = "gs",
		visual_line = "gS",
		delete = "dgs",
		change = "cgs",
	},
})
