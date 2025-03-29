local status, ibl = pcall(require, "ibl")
if not status then
	vim.notify("indent_blankline not found")
	return
end

ibl.setup()
