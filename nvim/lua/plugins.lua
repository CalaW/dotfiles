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
        "Mofiqul/dracula.nvim",
        -- Maybe neo-tree.nvim is an alternative
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function ()
                require("plugin-config.nvim-tree")
            end
        },
        {
            "akinsho/bufferline.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function ()
                require("plugin-config.bufferline")
            end
        },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
            config = function ()
                require("plugin-config.lualine")
            end
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function ()
                require("plugin-config.telescope")
            end
        },
        {
            "goolord/alpha-nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function ()
                require("plugin-config.alpha")
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function ()
                require("plugin-config.nvim-treesitter")
            end
        },
        -- indent-blankline
        {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("plugin-config.indent-blankline")
            end
        },
        -- toggleterm
        {
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugin-config.toggleterm")
            end
        },
        -- nvim-surround
        {
            "kylechui/nvim-surround",
            config = function()
                require("plugin-config.nvim-surround")
            end
        },
        -- Comment
        "numToStr/Comment.nvim",
        -- nvim-autopairs
        "windwp/nvim-autopairs",
        -- leap
        "ggandor/leap.nvim",
        -- vimtex
        -- "lervag/vimtex",
        --     config = function()
        --         require("plugin-config.vimtex")
        --     end,

        "wakatime/vim-wakatime",

        --------------- LSP ---------------
        "neovim/nvim-lspconfig", -- lsp config
        "hrsh7th/nvim-cmp", -- cmp engine
        -- snippet engine
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        -- cmp source
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- snippets
        "rafamadriz/friendly-snippets",
        -- ui
        {
            "glepnir/lspsaga.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"},
        },
        -- formatting
        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        }
}

local opts = {}

require("lazy").setup(plugins, opts)
