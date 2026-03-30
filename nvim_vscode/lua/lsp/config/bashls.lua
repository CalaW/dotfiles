local common = require("lsp.common")

local opts = {
    flags = common.flags,
    capabilities = common.capabilities,
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
    filetypes = {"sh", "zsh"}
}

return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
