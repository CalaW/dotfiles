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

alpha.setup(dashboard.config)
