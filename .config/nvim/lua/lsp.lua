local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local blink_ok, blink = pcall(require, "blink.cmp")
if blink_ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

local map = vim.keymap.set

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }

  map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
  map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
  map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
  map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
  map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
  map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
end

local setup = function(server, opts)
  opts = opts or {}
  opts.capabilities = capabilities
  opts.on_attach = opts.on_attach or on_attach
  lspconfig[server].setup(opts)
end

setup("pyright", {
  settings = {
    python = {
      analysis = { typeCheckingMode = "basic" },
    },
  },
})

setup("clangd")

setup("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})
