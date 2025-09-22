-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "bashls",
  "biome",
  "cssls",
  "html",
  "hyprls",
  "ruff",
  "rust_analyzer",
  "terraformls",
  "tinymist",
  "ts_ls",
}
vim.lsp.enable(servers)
