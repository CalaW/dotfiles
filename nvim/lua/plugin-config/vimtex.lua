vim.g.tex_flavor = "latex"
vim.g.vimtex_delim_toggle_mod_list = {
	{ "\\bigl", "\\bigr" },
	{ "\\Bigl", "\\Bigr" },
	{ "\\biggl", "\\biggr" },
	{ "\\Biggl", "\\Biggr" },
}
vim.g.vimtex_env_toggle_math_map = {
	["\\$"] = "\\(",
	["\\$\\$"] = "\\[",
	["\\("] = "\\[",
	["\\["] = "equation",
	["align*"] = "\\(",
	["equation"] = "align",
	["align"] = "\\(",
}

if vim.g.vscode then
	vim.g.vimtex_compiler_enabled = 0 -- disable compiler interface
	vim.g.vimtex_complete_enabled = 0 -- disable vimtex completion
	vim.g.vimtex_doc_enabled = 0 --disable features reltaed to vimtex-latexdoc
	vim.g.vimtex_fold_enabled = 0 -- disable folding
	vim.g.vimtex_fold_bib_enabled = 0 --disable folding in .bib files
	vim.g.vimtex_imaps_enabled = 0 -- Disable vimtex insert mode mappings
	vim.g.vimtex_include_search_enabled = 0 -- disable search for included files
	vim.g.vimtex_indent_enabled = 0 -- disable indentation
	vim.g.vimtex_indent_bib_enabled = 0 -- disable indentation
	vim.t.vimtex_matchparen_enabled = 0 -- disable matching delimiters highlighting
	vim.g.vimtex_quickfix_enabled = 0 -- disable quickfix
	vim.g.vimtex_syntax_enabled = 0 -- disable syntax highlighting
	vim.g.vimtex_toc_enabled = 0 -- disable table of contents
	vim.g.vimtex_view_enabled = 0 -- disable pdf viewer
end

if vim.fn.has("mac") == 1 then
	vim.g.vimtex_view_method = "skim"
	vim.g.vimtex_view_skim_sync = 1
	vim.g.vimtex_view_skim_activate = 1
end
