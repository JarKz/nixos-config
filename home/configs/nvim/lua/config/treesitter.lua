vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then
      return
    end
  end,
})
