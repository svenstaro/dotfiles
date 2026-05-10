-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "bashls",
  "biome",
  "cssls",
  "hyprls",
  "ruff",
  "rust_analyzer",
  "superhtml",
  "terraformls",
  "tinymist",
  "ts_ls",
}
vim.lsp.enable(servers)
