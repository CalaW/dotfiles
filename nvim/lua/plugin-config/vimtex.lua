vim.g.tex_flavor = 'latex'
vim.g.vimtex_delim_toggle_mod_list = {
    {"\\bigl", "\\bigr"},
    {"\\Bigl", "\\Bigr"},
    {"\\biggl", "\\biggr"},
    {"\\Biggl", "\\Biggr"},
}
vim.g.vimtex_env_toggle_math_map = {
    ["$"] = "\\(",
    ["$$"] = "\\[",
    ["\\("] = "\\[",
    ["\\["] = "align*",
    ["align*"] = "\\(",
    ["equation"] = "align",
    ["align"] = "\\(",
}

-- if vim.g.vscode then
    vim.g.vimtex_syntax_enabled = 0 -- disable syntax highlighting
    vim.g.vimtex_complete_enabled = 0 -- turn off completion
    vim.g.vimtex_imaps_enabled = 0 -- Disable vimtex insert mode mappings
    vim.g.vimtex_fold_enabled = 0 -- Disable fold
-- end

if vim.fn.has 'mac' == 1 then
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
end
