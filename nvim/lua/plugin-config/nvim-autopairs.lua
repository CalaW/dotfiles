-- https://github.com/windwp/nvim-autopairs
local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	vim.notify("nvim-autopairs not found")
	return
end
autopairs.setup({})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
