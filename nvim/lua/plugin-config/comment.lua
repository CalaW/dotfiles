local status, comment = pcall(require, "Comment")
if not status then
  vim.notify("Comment not found")
  return
end

comment.setup({})
