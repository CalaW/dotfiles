local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "git@github.com:folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        init = function()
            vim.g.nvim_surround_no_mappings = true
        end,
        keys = {
            { "<C-g>s", "<Plug>(nvim-surround-insert)", mode = "i", desc = "Surround insert" },
            { "<C-g>S", "<Plug>(nvim-surround-insert-line)", mode = "i", desc = "Surround insert line" },

            { "gs", "<Plug>(nvim-surround-normal)", mode = "n", desc = "Surround normal" },
            { "gss", "<Plug>(nvim-surround-normal-cur)", mode = "n", desc = "Surround current line" },
            { "gS", "<Plug>(nvim-surround-normal-line)", mode = "n", desc = "Surround line" },
            { "gSS", "<Plug>(nvim-surround-normal-cur-line)", mode = "n", desc = "Surround current line linewise" },

            { "gs", "<Plug>(nvim-surround-visual)", mode = "x", desc = "Surround visual" },
            { "gS", "<Plug>(nvim-surround-visual-line)", mode = "x", desc = "Surround visual line" },

            { "dgs", "<Plug>(nvim-surround-delete)", mode = "n", desc = "Delete surround" },
            { "cgs", "<Plug>(nvim-surround-change)", mode = "n", desc = "Change surround" },
        },
        opts = {
            surrounds = {
                invalid_key_behavior = false, -- disable literal surround
            },
            aliases = {
                ["p"] = ")",
                ["b"] = "]",
                ["r"] = false,
            },
            move_cursor = "sticky",
            highlight = { duration = 0 }, -- TODO why useless
        },
    },
    -- leap
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            local leap = require("leap")
            vim.keymap.set("n", "s", function()
                require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
            end)
            vim.keymap.set("n", "S", "<Plug>(leap-from-window)") -- or S maybe
            vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
            vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
        end,
    },
    -- vimtex
    {
        "lervag/vimtex",
        ft = "tex",
        init = function()
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_delim_toggle_mod_list = {
                { "\\bigl", "\\bigr" },
                { "\\Bigl", "\\Bigr" },
                { "\\biggl", "\\biggr" },
                { "\\Biggl", "\\Biggr" },
            }
            vim.g.vimtex_env_toggle_math_map = {
                ["\\$"] = "\\(",
                ["\\$\\$"] = "\\[",
                ["\\("] = "\\[",
                ["\\["] = "equation",
                ["align*"] = "\\(",
                ["equation"] = "align",
                ["align"] = "\\(",
            }

            vim.g.vimtex_compiler_enabled = 0 -- disable compiler interface
            vim.g.vimtex_complete_enabled = 0 -- disable vimtex completion
            vim.g.vimtex_doc_enabled = 0 --disable features related to vimtex-latex-doc
            vim.g.vimtex_fold_enabled = 0 -- disable folding
            vim.g.vimtex_fold_bib_enabled = 0 --disable folding in .bib files
            vim.g.vimtex_imaps_enabled = 0 -- Disable vimtex insert mode mappings
            vim.g.vimtex_include_search_enabled = 0 -- disable search for included files
            vim.g.vimtex_indent_enabled = 0 -- disable indentation
            vim.g.vimtex_indent_bib_enabled = 0 -- disable indentation
            vim.t.vimtex_matchparen_enabled = 0 -- disable matching delimiters highlighting
            vim.g.vimtex_quickfix_enabled = 0 -- disable quickfix
            vim.g.vimtex_syntax_enabled = 0 -- disable syntax highlighting
            vim.g.vimtex_toc_enabled = 0 -- disable table of contents
            vim.g.vimtex_view_enabled = 0 -- disable pdf viewer
        end,
    },
    -- input method select
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                -- IM will be set to `default_im_select` in `normal` mode
                -- For Windows/WSL, default: "1033", aka: English US Keyboard
                -- For macOS, default: "com.apple.keylayout.ABC", aka: US
                -- For Linux, default:
                --               "keyboard-us" for Fcitx5
                --               "1" for Fcitx
                --               "xkb:us::eng" for ibus
                -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
                default_im_select = "com.apple.keylayout.ABC",

                -- Can be binary's name, binary's full path, or a table, e.g. 'im-select',
                -- '/usr/local/bin/im-select' for binary without extra arguments,
                -- or { "AIMSwitcher.exe", "--imm" } for binary need extra arguments to work.
                -- For Windows/WSL, default: "im-select.exe"
                -- For macOS, default: "macism"
                -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
                default_command = "im-select",

                -- Restore the previous used input method state when the following events
                -- are triggered, if you don't want to restore previous used im in Insert mode,
                -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
                -- as `set_previous_events = {}`
                set_previous_events = {},
            })
        end,
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
