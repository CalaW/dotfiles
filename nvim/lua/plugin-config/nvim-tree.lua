local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("nvim-tree not found!")
	return
end

local on_attach = require("keybindings").nvimTreeOnAttach

nvim_tree.setup({
	git = {
		enable = true,
	},
	-- project plugin 需要这样设置
	-- update_cwd = true,
	-- update_focused_file = {
	--     enable = true,
	--     update_cwd = true,
	-- },
	-- 隐藏 .文件 和 node_modules 文件夹
	filters = {
		custom = { "^.git$" }, -- hide .git folder
	},
	view = {
		width = 30,
		side = "left",
		-- hide_root_folder = false,
		-- 不显示行数
		-- number = false,
		-- relativenumber = false,
		-- 显示图标
		-- signcolumn = 'yes',
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = true,
		},
	},
	-- open command, in macOS
	system_open = {
		cmd = "open",
	},
	on_attach = on_attach,
})
-- 自动关闭
-- vim.cmd([[
--     autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])
