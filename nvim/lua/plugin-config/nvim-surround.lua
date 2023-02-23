local status, surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("nvim-surround not found")
	return
end

surround.setup({})
