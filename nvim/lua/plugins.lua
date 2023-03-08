local packer = require("packer")
packer.startup({
    function(use)
        -- maybe lazy.nvim is an alternative
        use ("wbthomason/packer.nvim")
        use ("shaunsingh/nord.nvim")
        use ("Mofiqul/dracula.nvim")
        -- Maybe neo-tree.nvim is an alternative
        use {
            "nvim-tree/nvim-tree.lua",
            requires = "nvim-tree/nvim-web-devicons",
            config = function ()
                require("plugin-config.nvim-tree")
            end
        }
        use {
            "akinsho/bufferline.nvim",
            requires = "nvim-tree/nvim-web-devicons",
            config = function ()
                require("plugin-config.bufferline")
            end
        }
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
            config = function ()
                require("plugin-config.lualine")
            end
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function ()
                require("plugin-config.telescope")
            end
        }
        use {
            "goolord/alpha-nvim",
            requires = "nvim-tree/nvim-web-devicons",
            config = function ()
                require("plugin-config.alpha")
            end
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            -- run = ":TSUpdate",
            config = function ()
                require("plugin-config.nvim-treesitter")
            end
        }

        -- indent-blankline
        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("plugin-config.indent-blankline")
            end,
        })

        -- toggleterm
        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugin-config.toggleterm")
            end,
        })

        -- nvim-surround
        use({
            "kylechui/nvim-surround",
            config = function()
                require("plugin-config.nvim-surround")
            end,
        })

        -- Comment
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("plugin-config.comment")
            end,
        })

        -- nvim-autopairs
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("plugin-config.nvim-autopairs")
            end,
        })

        -- leap
        use({
            "ggandor/leap.nvim",
            -- requires = 
            config = function()
                require("plugin-config.leap")
            end,
        })

        use("wakatime/vim-wakatime")

        --------------- LSP ---------------
        use("neovim/nvim-lspconfig") -- lsp config
        use("hrsh7th/nvim-cmp") -- cmp engine
        -- snippet engine
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")
        -- cmp source
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        -- snippets
        use("rafamadriz/friendly-snippets")
        -- ui
        use({
            "glepnir/lspsaga.nvim",
            requires = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"},
        })
        -- formatting
        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = "nvim-lua/plenary.nvim",
        })

    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    }
})

-- Update plugins when saving this file
pcall(
    vim.cmd,
    [[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
        augroup end
    ]]
)
