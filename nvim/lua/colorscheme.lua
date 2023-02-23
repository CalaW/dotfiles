local colorscheme = "dracula"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not find!")
    return
end

local dracula = require("dracula")
dracula.setup({
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
  -- italic_comment = true, -- default false
})
