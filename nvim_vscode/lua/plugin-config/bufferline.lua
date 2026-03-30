local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("bufferline not found!")
	return
end

bufferline.setup({
	options = {
		-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
		-- close_command = "Bdelete! %d",
		-- right_mouse_command = "Bdelete! %d",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		diagnostics = "nvim_lsp",
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		-- 侧边栏配置
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				highlight = "Directory",
			},
		},
	},
})
