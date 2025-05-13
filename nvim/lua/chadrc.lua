-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",
  integrations = {
    "markview",
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  cmd = true,
  pkgs = {
    "bash-language-server",
    "biome",
    "css-lsp",
    "html-lsp",
    "hyprls",
    "lua-language-server",
    "ruff",
    "rust-analyzer",
    "stylua",
    "terraform-ls",
    "tinymist",
    "typescript-language-server",
  },
}

return M
