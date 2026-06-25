local makeprg = {
  python = "python3 %",
  lua = "lua %",
  sh = "bash %",
  bash = "bash %",
  zsh = "zsh %",
  go = "go run %",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(makeprg),
  callback = function(event)
    local cmd = makeprg[vim.bo[event.buf].filetype]
    if cmd then
      vim.bo[event.buf].makeprg = cmd
    end
  end,
})

vim.keymap.set("n", "<leader>r", function()
  if vim.bo.makeprg == "" then
    vim.notify("No makeprg for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
    return
  end
  vim.cmd.update()
  vim.cmd.make()
end, { desc = "Run buffer (makeprg)" })
