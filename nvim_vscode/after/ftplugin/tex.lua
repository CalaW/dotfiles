-- https://github.com/kylechui/nvim-surround/discussions/53#discussioncomment-3142459
require("nvim-surround").buffer_setup({
	surrounds = {
		["c"] = {
			add = function()
				local cmd = require("nvim-surround.config").get_input("Command: ")
				return { { "\\" .. cmd .. "{" }, { "}" } }
			end,
		},
		["e"] = {
			add = function()
				local env = require("nvim-surround.config").get_input("Environment: ")
				return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
			end,
		},
		["m"] = {
			add = { "\\(", "\\)" },
		},
		-- Chinese surroundings
		["）"] = {
			add = { "（", "）" },
		},
	},
})

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- Use `i` for the item text object
map({ "x", "o" }, "ai", "<Plug>(vimtex-am)", opt)
map({ "x", "o" }, "ii", "<Plug>(vimtex-im)", opt)

-- Use `m` for the math text object
map({ "x", "o" }, "am", "<Plug>(vimtex-a$)", opt)
map({ "x", "o" }, "im", "<Plug>(vimtex-i$)", opt)

-- Use `e` for environment navitation
map({ "n", "x", "o" }, "]e", "<Plug>(vimtex-]m)", opt)
map({ "n", "x", "o" }, "]E", "<Plug>(vimtex-]M)", opt)
map({ "n", "x", "o" }, "[e", "<Plug>(vimtex-[m)", opt)
map({ "n", "x", "o" }, "[E", "<Plug>(vimtex-[M)", opt)

-- Use `m` for environment navitation
map({ "n", "x", "o" }, "]m", "<Plug>(vimtex-]n)", opt)
map({ "n", "x", "o" }, "]M", "<Plug>(vimtex-]N)", opt)
map({ "n", "x", "o" }, "[m", "<Plug>(vimtex-[n)", opt)
map({ "n", "x", "o" }, "[M", "<Plug>(vimtex-[N)", opt)

-- using gs for surround
map("n", "dgse", "<Plug>(vimtex-env-delete)", opt)
map("n", "dgsc", "<Plug>(vimtex-cmd-delete)", opt)
map("n", "dgsm", "<Plug>(vimtex-env-delete-math)", opt)
map("n", "dgsd", "<Plug>(vimtex-delim-delete)", opt)

map("n", "cgse", "<Plug>(vimtex-env-change)", opt)
map("n", "cgsc", "<Plug>(vimtex-cmd-change)", opt)
map("n", "cgsm", "<Plug>(vimtex-env-change-math)", opt)
map("n", "cgsd", "<Plug>(vimtex-delim-change)", opt)

map("n", "tgsf", "<Plug>(vimtex-cmd-toggle-frac)", opt)
map("n", "tgsc", "<Plug>(vimtex-cmd-toggle-star)", opt)
map("n", "tgse", "<Plug>(vimtex-env-toggle-star)", opt)
map("n", "tgsm", "<Plug>(vimtex-env-toggle-math)", opt)
map("n", "tgsd", "<Plug>(vimtex-delim-toggle-modifier)", opt)
map("n", "tgsD", "<Plug>(vimtex-delim-toggle-modifier-reverse)", opt)
