local M = {}

M.keyAttach = function(bufnr)
	require("keybindings").mapLSP(bufnr)
end

M.disableFormat = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

return M
