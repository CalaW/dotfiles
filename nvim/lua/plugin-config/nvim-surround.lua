local status, surround = pcall(require, "nvim-surround")
if not status then
    vim.notify("nvim-surround not found")
    return
end

surround.setup({
    surrounds = {
        -- disable literal surround
        invalid_key_behavior = false,
    },
    aliases = {
        ["p"] = ")",
        ["b"] = "]",
        ["r"] = false,
    },
    move_cursor = false,
    indent_lines = false,
})
