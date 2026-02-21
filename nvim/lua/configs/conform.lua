local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    python = { "ruff_format" },
    -- Disable shell formatting as I don't like the way it formats.
    sh = { "trim_whitespace", lsp_format = "fallback" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = function(bufnr)
    -- Don't try to format PKGBUILDs. No one can format them, not even computer.
    local ignore_filenames = { "PKGBUILD" }
    local bufname = vim.api.nvim_buf_get_name(0)
    local basename = vim.fn.fnamemodify(bufname, ":t")
    if vim.tbl_contains(ignore_filenames, basename) then
      return
    end

    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return { timeout_ms = 500, lsp_fallback = true }
  end,
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

return options
