local function map(mode, lhs, rhs, desc, bufnr)
  local opts = {}
  opts.noremap = true
  opts.silent = true
  if desc ~= nil then opts.desc = desc end
  if bufnr ~= nil then opts.buffer = bufnr end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Search
map('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>')

-- Pack
map('n', '<leader>p', '', ' Packages')
map('n', '<leader>pu', '<cmd>lua vim.pack.update()<CR>', ' Update')
map('n', '<leader>pi', '<cmd>lua vim.pack.get()<CR>', ' Info')
map('n', '<leader>pm', '<cmd>Mason<cr>', ' Mason')

-- Telescope
map('n', '<leader>f', '', ' Find')
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', '󰱼 Find Files')
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', '󱎸 Find Words')
map('n', '<leader>fF', function() require("plugins.telescope").find_all_files() end, '󱈆 Find All Files')
map('n', '<leader>fW', function() require("plugins.telescope").find_all_words() end, '󰨼 Find All Words')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', '󰩉 Find Buffer')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', '󰨭 Find Old')
map('n', '<leader>fm', '<cmd>Telescope marks<CR>', '󱤇 Find Marks')

-- Buffers
map('n', '<leader>b', '', '󰓩 Buffers')
map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>c', '<cmd>bd<CR>')
map('n', '<leader>W', '<cmd>SudaWrite<CR>')
map('n', '<leader>q', '<cmd>q<CR>')
map('n', '<M-w>', '<cmd>w<CR>')
map('n', '<M-W>', '<cmd>SudaWrite<CR>')
map('n', '<M-q>', '<cmd>q<CR>')
for i = 1, 9 do
  map('n', '<A-' .. i .. '>', function() require("bufferline").go_to(i, true) end)
end
map('n', "<M-'>", '<cmd>BufferLineCycleNext<CR>')
map('n', '<A-J>', '<cmd>BufferLineMovePrev<CR>')
map('n', '<A-K>', '<cmd>BufferLineMoveNext<CR>')
map('n', '<leader>b[', '<cmd>BufferLineCyclePrev<CR>', ' Prev Buffer')
map('n', '<leader>b]', '<cmd>BufferLineCycleNext<CR>', ' Next Buffer')
map('n', '<leader>bj', '<cmd>BufferLineMovePrev<CR>', ' Move Left')
map('n', '<leader>bk', '<cmd>BufferLineMoveNext<CR>', ' Move Right')
map('n', '<leader>bw', '<cmd>w<CR>', '󰆓 Write')
map('n', '<leader>bq', '<cmd>q<CR>', ' Close')
map('n', '<leader>bW', '<cmd>w!<CR>', '󰽂 Force Write')
map('n', '<leader>bQ', '<cmd>q!<CR>', ' Force Close')
map('n', '<leader>bx', '<cmd>BufferLineCloseOthers<CR>', ' Close Others')
-- map('n', '<leader>ba', function() require("sllm").toggle_llm_buffer() end, ' Toggle LLM')

-- Window
map('n', '\\', function()
  vim.cmd((vim.api.nvim_win_get_width(0) < vim.o.columns) and 'split' or 'vsplit')
end)

-- NeoTree
map('n', '<leader>e', '', ' NeoTree')
map('n', '<M-e>', '<cmd>Neotree filesystem toggle<CR>')
map('n', '<M-1>', '<cmd>Neotree filesystem toggle<CR>')
map('n', '<leader>ee', '<cmd>Neotree filesystem toggle<CR>', ' Toggle')
map('n', '<leader>et', '<cmd>Neotree filesystem reveal<CR>', ' Current file')
map('n', '<leader>eb', '<cmd>Neotree buffers toggle<CR>', '󱦞 Buffers')
map('n', '<leader>es', '<cmd>Neotree git_status toggle<CR>', ' Git Status')

-- LSP
map('n', '<leader>l', '', ' LSP')
map('n', '<leader>lI', vim.lsp.buf.hover, '󰈙 Documentation')
map('n', '<leader>ld', vim.lsp.buf.definition, '󰦨 Definition')
map('n', '<leader>lD', vim.lsp.buf.declaration, '󰩳 Declaration')
map('n', '<leader>li', vim.lsp.buf.implementation, ' Implementation')
map('n', '<leader>lx', vim.lsp.buf.references, ' References')
map('n', '<leader>lk', vim.lsp.buf.signature_help, '󱧃 Signature')
map('n', '<leader>lr', vim.lsp.buf.rename, '󰑕 Rename')
map('n', '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, '󰉡 Format')
map('n', '<leader>lA', vim.diagnostic.open_float, ' Diag. Float')
map('n', '<leader>ll', vim.diagnostic.setloclist, ' Diag. List')
map('n', '<leader>lm', '<cmd>Mason<cr>', ' Mason')
map({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, ' Actions')
map('n', '<F2>', function() vim.diagnostic.jump({ count = 1 }) end, '󰅂 Next Diagnostic')
map('n', '<S-F2>', function() vim.diagnostic.jump({ count = -1 }) end, '󰅁 Prev Diagnostic')
