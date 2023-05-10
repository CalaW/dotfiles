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
        config = get_config("nvim-treesitter")
    },
    -- indent-blankline: indent guide
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        cond = not vim.g.vscode,
        config = get_config("indent-blankline")
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
        config = get_config("nvim-surround")
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
    -- flit and leap
    -- {
    --     "ggandor/flit.nvim",
    --     config = function()
    --         require("plugin-config.flit")
    --     end
    -- },
    {
        "ggandor/leap.nvim",
        config = get_config("leap")
    },
    -- mini.ai, better text object
    -- {
    --     "echasnovski/mini.ai",
    --     event = "VeryLazy",
    --     dependencies = { "nvim-treesitter-textobjects" },
    --     opts = function()
    --         local ai = require("mini.ai")
    --         return {
    --             n_lines = 500,
    --             custom_textobjects = {
    --                 o = ai.gen_spec.treesitter({
    --                     a = { "@block.outer", "@conditional.outer", "@loop.outer" },
    --                     i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    --                 }, {}),
    --                 f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    --                 c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
    --             },
    --         }
    --     end,
    --     config = function(_, opts)
    --         require("mini.ai").setup(opts)
    -- -- register all text objects with which-key
    -- if require("lazyvim.util").has("which-key.nvim") then
    --     ---@type table<string, string|table>
    --     local i = {
    --         [" "] = "Whitespace",
    --         ['"'] = 'Balanced "',
    --         ["'"] = "Balanced '",
    --         ["`"] = "Balanced `",
    --         ["("] = "Balanced (",
    --         [")"] = "Balanced ) including white-space",
    --         [">"] = "Balanced > including white-space",
    --         ["<lt>"] = "Balanced <",
    --         ["]"] = "Balanced ] including white-space",
    --         ["["] = "Balanced [",
    --         ["}"] = "Balanced } including white-space",
    --         ["{"] = "Balanced {",
    --         ["?"] = "User Prompt",
    --         _ = "Underscore",
    --         a = "Argument",
    --         b = "Balanced ), ], }",
    --         c = "Class",
    --         f = "Function",
    --         o = "Block, conditional, loop",
    --         q = "Quote `, \", '",
    --         t = "Tag",
    --     }
    --     local a = vim.deepcopy(i)
    --     for k, v in pairs(a) do
    --         a[k] = v:gsub(" including.*", "")
    --     end
    
    --     local ic = vim.deepcopy(i)
    --     local ac = vim.deepcopy(a)
    --     for key, name in pairs({ n = "Next", l = "Last" }) do
    --         i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
    --         a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    --     end
    --     require("which-key").register({
    --         mode = { "o", "x" },
    --         i = i,
    --         a = a,
    --     })
    -- end
    --     end,
    -- },
    -- vimtex
    {
        "lervag/vimtex",
        ft = "tex",
        config = get_config("vimtex"),
        keys = {
            -- Use `i` for the item text object
            { "ai", "<Plug>(vimtex-am)", mode = "o" },
            { "ai", "<Plug>(vimtex-am)", mode = "x" },
            { "ii", "<Plug>(vimtex-im)", mode = "o" },
            { "ii", "<Plug>(vimtex-im)", mode = "x" },
            
            -- Use `m` for the math text object
            { "am", "<Plug>(vimtex-a$)", mode = "o" },
            { "am", "<Plug>(vimtex-a$)", mode = "x" },
            { "im", "<Plug>(vimtex-i$)", mode = "o" },
            { "im", "<Plug>(vimtex-i$)", mode = "x" },
            { "tsm", "<Plug>(vimtex-env-toggle-math)" },
            { "dsm", "<Plug>(vimtex-env-delete-math)" },
            
            -- Use `e` for environment navitation
            { "]e", "<Plug>(vimtex-]m)", mode = "n" },
            { "]e", "<Plug>(vimtex-]m)", mode = "x" },
            { "]e", "<Plug>(vimtex-]m)", mode = "o" },
            { "]E", "<Plug>(vimtex-]M)", mode = "n" },
            { "]E", "<Plug>(vimtex-]M)", mode = "x" },
            { "]E", "<Plug>(vimtex-]M)", mode = "o" },
            { "[e", "<Plug>(vimtex-[m)", mode = "n" },
            { "[e", "<Plug>(vimtex-[m)", mode = "x" },
            { "[e", "<Plug>(vimtex-[m)", mode = "o" },
            { "[E", "<Plug>(vimtex-[M)", mode = "n" },
            { "[E", "<Plug>(vimtex-[M)", mode = "x" },
            { "[E", "<Plug>(vimtex-[M)", mode = "o" },
            
            -- Use `m` for environment navitation
            { "]m", "<Plug>(vimtex-]n)", mode = "n" },
            { "]m", "<Plug>(vimtex-]n)", mode = "x" },
            { "]m", "<Plug>(vimtex-]n)", mode = "o" },
            { "]M", "<Plug>(vimtex-]N)", mode = "n" },
            { "]m", "<Plug>(vimtex-]n)", mode = "x" },
            { "]m", "<Plug>(vimtex-]n)", mode = "o" },
            { "[m", "<Plug>(vimtex-[n)", mode = "n" },
            { "]m", "<Plug>(vimtex-]n)", mode = "x" },
            { "]m", "<Plug>(vimtex-]n)", mode = "o" },
            { "[M", "<Plug>(vimtex-[N)", mode = "n" },
            { "]m", "<Plug>(vimtex-]n)", mode = "x" },
            { "]m", "<Plug>(vimtex-]n)", mode = "o" },
        },
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
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cond = not vim.g.vscode,
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
