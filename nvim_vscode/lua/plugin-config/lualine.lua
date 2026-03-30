local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("lualine not found")
	return
end

lualine.setup({
	options = {
		theme = "dracula-nvim",
		-- component_separators = { left = "|", right = "|" },
		-- section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			"filename",
			{
				"lsp_progress",
				timer = { progress_enddelay = 500, spinner = 100, lsp_client_name_enddelay = 1000 },
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
		},
		lualine_x = {
			"filesize",
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"filetype",
		},
	},
})
