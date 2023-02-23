local status, alpha = pcall(require, "alpha")
if not status then
    vim.notify("alpha not found!")
    return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    [[   ____              ___             __      __      ]],
    [[  /\  _`\           /\_ \           /\ \  __/\ \     ]],
    [[  \ \ \/\_\     __  \//\ \      __  \ \ \/\ \ \ \    ]],
    [[   \ \ \/_/_  /'__`\  \ \ \   /'__`\ \ \ \ \ \ \ \   ]],
    [[    \ \ \L\ \/\ \L\.\_ \_\ \_/\ \L\.\_\ \ \_/ \_\ \  ]],
    [[     \ \____/\ \__/.\_\/\____\ \__/.\_\\ `\___x___/  ]],
    [[      \/___/  \/__/\/_/\/____/\/__/\/_/ '\/__//__/   ]],
    [[                                                     ]],

    -- "                                                     ",
    -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    -- "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    -- dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    -- dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "s", "  > Settings" , ":e ~/.dotfiles/nvim/init.lua | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
-- alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])

alpha.setup(dashboard.config)
