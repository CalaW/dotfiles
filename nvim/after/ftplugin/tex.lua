-- https://github.com/kylechui/nvim-surround/discussions/53#discussioncomment-3142459
require("nvim-surround").buffer_setup ({
    surrounds = {
        ["c"] = {
            add = function()
                local cmd = require("nvim-surround.config").get_input "Command: "
                return { { "\\" .. cmd .. "{" }, { "}" } }
            end,
        },
        ["e"] = {
            add = function()
                local env = require("nvim-surround.config").get_input "Environment: "
                return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
            end,
        },
        ["m"] = {
            add = { "\\(", "\\)" },
        },
    },
})

-- local map = vim.keymap.set
-- local opt = {noremap = true, silent = true}

-- -- Use `i` for the item text object
-- map("o", "ai", "<Plug>(vimtex-am)", opt)
-- map("x", "ai", "<Plug>(vimtex-am)", opt)
-- map("o", "ii", "<Plug>(vimtex-im)", opt)
-- map("x", "ii", "<Plug>(vimtex-im)", opt)

-- -- Use `m` for the math text object
-- map("o", "am", "<Plug>(vimtex-a$)", opt)
-- map("x", "am", "<Plug>(vimtex-a$)", opt)
-- map("o", "im", "<Plug>(vimtex-i$)", opt)
-- map("x", "im", "<Plug>(vimtex-i$)", opt)
-- map("n", "tsm", "<Plug>(vimtex-env-toggle-math)", opt)
-- map("n", "dsm", "<Plug>(vimtex-env-delete-math)", opt)

-- -- Use `e` for environment navitation
-- map("n", "]e", "<Plug>(vimtex-]m)", opt)
-- map("x", "]e", "<Plug>(vimtex-]m)", opt)
-- map("o", "]e", "<Plug>(vimtex-]m)", opt)
-- map("n", "]E", "<Plug>(vimtex-]M)", opt)
-- map("x", "]E", "<Plug>(vimtex-]M)", opt)
-- map("o", "]E", "<Plug>(vimtex-]M)", opt)
-- map("n", "[e", "<Plug>(vimtex-[m)", opt)
-- map("x", "[e", "<Plug>(vimtex-[m)", opt)
-- map("o", "[e", "<Plug>(vimtex-[m)", opt)
-- map("n", "[E", "<Plug>(vimtex-[M)", opt)
-- map("x", "[E", "<Plug>(vimtex-[M)", opt)
-- map("o", "[E", "<Plug>(vimtex-[M)", opt)

-- -- Use `m` for environment navitation
-- map("n", "]m", "<Plug>(vimtex-]n)", opt)
-- map("x", "]m", "<Plug>(vimtex-]n)", opt)
-- map("o", "]m", "<Plug>(vimtex-]n)", opt)
-- map("n", "]M", "<Plug>(vimtex-]N)", opt)
-- map("x", "]M", "<Plug>(vimtex-]N)", opt)
-- map("o", "]M", "<Plug>(vimtex-]N)", opt)
-- map("n", "[m", "<Plug>(vimtex-[n)", opt)
-- map("x", "[m", "<Plug>(vimtex-[n)", opt)
-- map("o", "[m", "<Plug>(vimtex-[n)", opt)
-- map("n", "[M", "<Plug>(vimtex-[N)", opt)
-- map("x", "[M", "<Plug>(vimtex-[N)", opt)
-- map("o", "[M", "<Plug>(vimtex-[N)", opt)
