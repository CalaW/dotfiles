local function get_config(name)
    return function()
        require(string.format("plugin-config/%s", name))
    end
end

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
    -- {
    --     "Mofiqul/dracula.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     cond = not vim.g.vscode,
    --     config = function ()
    --         vim.cmd("colorscheme dracula")
    --         require("dracula").setup({
    --             -- customize dracula color palette
    --             colors = {
    --                 bg = "#22212C",
    --                 fg = "#F8F8F2",
    --                 selection = "#454158",
    --                 comment = "#7970A9",
    --                 red = "#FF9580",
    --                 orange = "#FFCA80",
    --                 yellow = "#FFFF80",
    --                 green = "#8AFF80",
    --                 purple = "#9580FF",
    --                 cyan = "#80FFEA",
    --                 pink = "#FF80BF",
    --                 -- unchanged
    --                 bright_red = "#FF6E6E",
    --                 bright_green = "#69FF94",
    --                 bright_yellow = "#FFFFA5",
    --                 bright_blue = "#D6ACFF",
    --                 bright_magenta = "#FF92DF",
    --                 bright_cyan = "#A4FFFF",
    --                 bright_white = "#FFFFFF",
    --                 menu = "#21222C",
    --                 visual = "#3E4452",
    --                 gutter_fg = "#4B5263",
    --                 nontext = "#3B4048",
    --             },
    --             -- -- use transparent background
    --             -- transparent_bg = true, -- default false
    --             -- -- set custom lualine background color
    --             -- lualine_bg_color = "#44475a", -- default nil
    --             -- -- set italic comment
    --             -- italic_comment = true, -- default false})
    --         })
    --     end,
    -- },
    -- -- Maybe neo-tree.nvim is an alternative
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     event = "VeryLazy",
    --     cond = not vim.g.vscode,
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = get_config("nvim-tree")
    -- },
    -- -- bufferline: top tab line
    -- {
    --     "akinsho/bufferline.nvim",
    --     event = "VeryLazy",
    --     cond = not vim.g.vscode,
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = get_config("bufferline")
    -- },
    -- -- lualine: bottom buffer line
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     event = "VeryLazy",
    --     cond = not vim.g.vscode,
    --     dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
    --     config = get_config("lualine")
    -- },
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     cmd = "Telescope",
    --     cond = not vim.g.vscode,
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     config = get_config("telescope")
    -- },
    -- {
    --     "goolord/alpha-nvim",
    --     event = "VimEnter",
    --     cond = not vim.g.vscode,
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = get_config("alpha")
    -- },
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     version = false,
    --     cond = not vim.g.vscode,
    --     build = ":TSUpdate",
    --     event = { "BufReadPost", "BufNewFile" },
    --     config = get_config("nvim-treesitter")
    -- },
    -- -- indent-blankline: indent guide
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = { "BufReadPost", "BufNewFile" },
    --     main = "ibl",
    --     cond = not vim.g.vscode,
    --     config = get_config("indent-blankline"),
    -- },
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
    },
    -- vimtex
    {
        "lervag/vimtex",
        ft = "tex",
        init = get_config("vimtex"),
    },
    -- -- wakatime for coding time status
    -- {
    --     "wakatime/vim-wakatime",
    --     event = "VeryLazy",
    --     cond = not vim.g.vscode,
    -- },
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
    --------------- LSP ---------------
    -- {
    --     "neovim/nvim-lspconfig", -- lsp config
    --     event = { "BufReadPre", "BufNewFile" },
    --     cond = not vim.g.vscode,
    -- },
    -- {
    --     "hrsh7th/nvim-cmp", -- cmp engine
    --     cond = not vim.g.vscode,
    -- },
    -- -- snippet engine
    -- {
    --     "L3MON4D3/LuaSnip",
    --     cond = not vim.g.vscode,
    -- },
    -- {
    --     "saadparwaiz1/cmp_luasnip",
    --     cond = not vim.g.vscode,
    -- },
    -- -- cmp source
    -- {
    --     "hrsh7th/cmp-nvim-lsp",
    --     cond = not vim.g.vscode,
    -- },
    -- {
    --     "hrsh7th/cmp-buffer",
    --     cond = not vim.g.vscode,
    -- },
    -- {
    --     "hrsh7th/cmp-path",
    --     cond = not vim.g.vscode,
    -- },
    -- {
    --     "hrsh7th/cmp-cmdline",
    --     cond = not vim.g.vscode,
    -- },
    -- -- snippets
    -- {
    --     "rafamadriz/friendly-snippets",
    --     cond = not vim.g.vscode,
    -- },
    -- -- formatting
    -- {
    --     "nvimtools/none-ls.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     cond = not vim.g.vscode,
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- }
}

local opts = {}

require("lazy").setup(plugins, opts)
