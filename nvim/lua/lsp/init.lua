local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("lspconfig not found")
	return
end

local servers = {
	lua_ls = require("lsp.config.lua_ls"),
	pyright = require("lsp.config.pyright"),
	texlab = require("lsp.config.texlab"),
	clangd = require("lsp.config.clangd"),
	bashls = require("lsp.config.bashls"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		config.on_setup(lspconfig[name])
	else
		lspconfig[name].setup({})
	end
end

require("lsp.ui")
