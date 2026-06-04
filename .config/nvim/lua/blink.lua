local ok, blink = pcall(require, "blink.cmp")
if not ok then
  vim.notify("blink.cmp not found — run :PlugInstall", vim.log.levels.WARN)
  return
end

blink.setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { auto_show = false },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})

return blink
