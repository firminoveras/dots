local api = vim.api

api.nvim_create_autocmd("UIEnter", {
  callback = function()
    -- Hide CmdBar
    vim.opt.cmdheight = 0
  end,
})

api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*" },
  callback = function()
    -- Caret placement
    vim.cmd [[
      if line("'\"") > 0 && line("'\"") <= line("$") |
        exe "normal! g`\"" |
      endif
    ]]
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    if vim.lsp.document_color and vim.lsp.document_color.enable then
      vim.lsp.document_color.enable(false, { bufnr = args.buf })
    end
  end,
})
