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
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        cond = not vim.g.vscode,
        config = function ()
            vim.cmd("colorscheme dracula")
            require("dracula").setup({
                -- customize dracula color palette
                colors = {
                    bg = "#22212C",
                    fg = "#F8F8F2",
                    selection = "#454158",
                    comment = "#7970A9",
                    red = "#FF9580",
                    orange = "#FFCA80",
                    yellow = "#FFFF80",
                    green = "#8AFF80",
                    purple = "#9580FF",
                    cyan = "#80FFEA",
                    pink = "#FF80BF",
                    -- unchanged
                    bright_red = "#FF6E6E",
                    bright_green = "#69FF94",
                    bright_yellow = "#FFFFA5",
                    bright_blue = "#D6ACFF",
                    bright_magenta = "#FF92DF",
                    bright_cyan = "#A4FFFF",
                    bright_white = "#FFFFFF",
                    menu = "#21222C",
                    visual = "#3E4452",
                    gutter_fg = "#4B5263",
                    nontext = "#3B4048",
                },
                -- -- use transparent background
                -- transparent_bg = true, -- default false
                -- -- set custom lualine background color
                -- lualine_bg_color = "#44475a", -- default nil
                -- -- set italic comment
                -- italic_comment = true, -- default false})
            })
        end,
    },
    -- Maybe neo-tree.nvim is an alternative
    {
        "nvim-tree/nvim-tree.lua",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("plugin-config.nvim-tree")
        end
    },
    {
        "akinsho/bufferline.nvim",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("plugin-config.bufferline")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
        config = function ()
            require("plugin-config.lualine")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        cond = not vim.g.vscode,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            require("plugin-config.telescope")
        end
    },
    {
        "goolord/alpha-nvim",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("plugin-config.alpha")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        -- dependencies = {
        --     {
        --         "nvim-treesitter/nvim-treesitter-textobjects",
        --         init = function()
        --             -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        --             local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
        --             local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        --             local enabled = false
        --             if opts.textobjects then
        --                 for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
        --                     if opts.textobjects[mod] and opts.textobjects[mod].enable then
        --                         enabled = true
        --                         break
        --                     end
        --                 end
        --             end
        --             if not enabled then
        --                 require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        --             end
        --         end,
        --     },
        -- },
        config = function ()
            require("plugin-config.nvim-treesitter")
        end
    },
    -- indent-blankline: indent guide
    {
        "lukas-reineke/indent-blankline.nvim",
        cond = not vim.g.vscode,
        config = function()
            require("plugin-config.indent-blankline")
        end
    },
    -- toggleterm
    {
        "akinsho/toggleterm.nvim",
        cond = not vim.g.vscode,
        config = function()
            require("plugin-config.toggleterm")
        end
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("plugin-config.nvim-surround")
        end
    },
    -- Comment
    {
        "numToStr/Comment.nvim",
        cond = not vim.g.vscode,
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        cond = not vim.g.vscode,
    },
    -- leap
    {
        "ggandor/leap.nvim",
        config = function()
            require("plugin-config.leap")
        end
    },
    -- vimtex
    {
        "lervag/vimtex",
        ft = "tex",
        config = function()
            require("plugin-config.vimtex")
        end,
    },
    {
        "wakatime/vim-wakatime",
        cond = not vim.g.vscode,
    },
    --------------- LSP ---------------
    {
        "neovim/nvim-lspconfig", -- lsp config
        cond = not vim.g.vscode,
    },
    {
        "hrsh7th/nvim-cmp", -- cmp engine
        cond = not vim.g.vscode,
    },
    -- snippet engine
    {
        "L3MON4D3/LuaSnip",
        cond = not vim.g.vscode,
    },
    {
        "saadparwaiz1/cmp_luasnip",
        cond = not vim.g.vscode,
    },
    -- cmp source
    {
        "hrsh7th/cmp-nvim-lsp",
        cond = not vim.g.vscode,
    },
    {
        "hrsh7th/cmp-buffer",
        cond = not vim.g.vscode,
    },
    {
        "hrsh7th/cmp-path",
        cond = not vim.g.vscode,
    },
    {
        "hrsh7th/cmp-cmdline",
        cond = not vim.g.vscode,
    },
    -- snippets
    {
        "rafamadriz/friendly-snippets",
        cond = not vim.g.vscode,
    },
    -- ui
    {
        "glepnir/lspsaga.nvim",
        cond = not vim.g.vscode,
        event = "LspAttach",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"},
    },
    -- formatting
    {
        "jose-elias-alvarez/null-ls.nvim",
        cond = not vim.g.vscode,
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
