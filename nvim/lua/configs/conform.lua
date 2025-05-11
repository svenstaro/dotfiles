local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    python = { "ruff_format" },
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

    return { timeout_ms = 500, lsp_fallback = true }
  end,
}

return options
