local common = require("lsp.common")

local opts = {
    flags = common.flags,
    capabilities = common.capabilities,
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
        require("keybindings").mapLSPtexlab(bufnr)
    end,
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdfxe", "-bibtex", "-synctex=1", "-shell-escape", "-interaction=nonstopmode", "-file-line-error", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = false
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    }
}

return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
