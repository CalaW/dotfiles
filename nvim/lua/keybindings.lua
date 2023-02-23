-- leader <space> or , 
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Marcos
local map = vim.keymap.set
local opt = {noremap = true, silent = true}

-- indent in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- select text with j/k
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- scrolling
-- map("", "<ScrollWhellUp>", "<C-Y>")
-- map("", "<ScrollWhellDown>", "<C-E>")

local pluginKeys = {}

-- nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<cr>", opt)
pluginKeys.nvimTreeList = {
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
}
-- telescope
map('n', '<leader>ff', ":Telescope find_files<CR>", opt)
map('n', '<leader>fg', ":Telescope live_grep<CR>", opt)
map('n', '<leader>fb', ":Telescope buffers<CR>", opt)
map('n', '<leader>fh', ":Telescope help_tags<CR>", opt)
-- lsp
map('n', '<leader>e', vim.diagnostic.open_float, opt)
map('n', '[d', vim.diagnostic.goto_prev, opt)
map('n', ']d', vim.diagnostic.goto_next, opt)
map('n', '<space>q', vim.diagnostic.setloclist, opt)
pluginKeys.mapLSP = function(bufnr)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'gh', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
pluginKeys.mapLSPtexlab = function (bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    map('n', '<D-∫>', ":TexlabBuild<cr>", bufopts)
end
-- nvim-cmp
pluginKeys.cmp = function (cmp, luasnip)
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    return {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }
end

return pluginKeys
