local ok_mason, mason = pcall(require, "mason")
if not ok_mason then return end

local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then return end

vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = '󰌵',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.ERROR] = '󱎘',
    }
  },
}

mason.setup {
  install_root_dir = vim.fn.stdpath("data") .. "/mason",
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
  pip = {
    upgrade_pip = false
  },
  ui = {
    check_outdated_packages_on_open = true,
    border = "solid",
    icons = {
      package_installed   = "✓",
      package_pending     = "➜",
      package_uninstalled = "✗",
    },
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      uninstall_package = "X",
      cancel_installation = "<C-c>",
    },
  },
}

local servers = {
  "lua_ls",
  "pyright",
  "bashls",
  "jsonls",
  "html",
  "cssls",
}

mason_lspconfig.setup {
  automatic_installation = true,
  ensure_installed = servers,
}

local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok_cmp_lsp and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
end

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      runtime = { version = 'LuaJIT' },
      diagnostics = { enable = true, globals = { "vim", "th", "ui" } },
      telemetry = { enable = false },
    }
  }
})

vim.lsp.enable(servers)
