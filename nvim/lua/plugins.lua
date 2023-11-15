local function get_config(name)
    return function() require(string.format('plugin-config/%s', name)) end
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
        event = "VeryLazy",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = get_config("nvim-tree") 
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = get_config("bufferline")
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
        config = get_config("lualine")
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        cond = not vim.g.vscode,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = get_config("telescope")
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = get_config("alpha")
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        cond = not vim.g.vscode,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = get_config("nvim-treesitter")
    },
    -- indent-blankline: indent guide
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        cond = not vim.g.vscode,
        config = get_config("indent-blankline"),
    },
    -- toggleterm
    -- {
    --     "akinsho/toggleterm.nvim",
    --     cond = not vim.g.vscode,
    --     config = function()
    --         require("plugin-config.toggleterm")
    --     end
    -- },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = get_config("nvim-surround"),
    },
    -- Comment
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        cond = not vim.g.vscode,
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        cond = not vim.g.vscode,
    },
    -- leap
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = get_config("leap")
    },
    -- vimtex
    {
        "lervag/vimtex",
        ft = "tex",
        init = get_config("vimtex"),
    },
    {
        "wakatime/vim-wakatime",
        event = "VeryLazy",
        cond = not vim.g.vscode,
    },
    -- input method select
    {
        'keaising/im-select.nvim',
        config = get_config("im-select")
    },
    --------------- LSP ---------------
    {
        "neovim/nvim-lspconfig", -- lsp config
        event = { "BufReadPre", "BufNewFile" },
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
    -- {
    --     "glepnir/lspsaga.nvim",
    --     cond = not vim.g.vscode,
    --     event = "LspAttach",
    --     dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"},
    -- },
    -- formatting
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cond = not vim.g.vscode,
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
