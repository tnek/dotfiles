if vim.fn.has("nvim-0.11") ~= 1 then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local blink_ok, blink = pcall(require, "blink.cmp")
if blink_ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

local map = vim.keymap.set

local clangd_cmd = function()
  if vim.fn.executable("clangd") == 1 then
    return vim.fn.exepath("clangd")
  end
  for _, path in ipairs({ "/opt/homebrew/opt/llvm/bin/clangd", "/usr/local/opt/llvm/bin/clangd" }) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end
  return "clangd"
end

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }

  map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
  map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
  map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
  map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
  map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true, bufnr = bufnr })
  end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
  map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
  map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
end

local setup = function(server, opts)
  opts = opts or {}
  opts.capabilities = capabilities
  opts.on_attach = opts.on_attach or on_attach
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

setup("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

setup("pyright", {
  settings = {
    python = {
      analysis = { typeCheckingMode = "basic" },
    },
  },
})

setup("clangd", {
  cmd = {
    clangd_cmd(),
    "--background-index",
    "--clang-tidy",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", ".git" },
})

setup("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- Format on save via LSP (Go uses vim-go instead)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].filetype == "go" then
      return
    end
    if #vim.lsp.get_clients({ bufnr = args.buf }) == 0 then
      return
    end
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 3000, async = false })
  end,
})
