require "nvchad.mappings"

local map = vim.keymap.set
local gitsigns = require "gitsigns"

map("n", ";", ":", { desc = "CMD enter command mode" })

-- quickfix
map("n", "<leader>q", "<cmd>copen<cr>", { desc = "quickfix open" })
map("n", "<leader>Q", "<cmd>cclose<cr>", { desc = "quickfix close" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function(event)
    map("n", "q", "<cmd>cclose<cr>", { desc = "quickfix close", buffer = event.buf })
  end,
})
-- Cycle through quickfix list items
map("n", "]q", "<cmd>try | cnext | catch | cfirst | catch | endtry<cr>", { desc = "quickfix next" })
map("n", "[q", "<cmd>try | cprevious | catch | clast | catch | endtry<cr>", { desc = "quickfix previous" })

-- gitsigns
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "gitsigns next hunk" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "gitsigns previous hunk" })
map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "gitsigns stage hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "gitsigns reset hunk" })
map("n", "<leader>gb", gitsigns.blame, { desc = "gitsigns blame" })
map("v", "<leader>gs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "gitsigns stage hunk" })

map("v", "<leader>gr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "gitsigns reset hunk" })

map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "gitsigns stage buffer" })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "gitsigns reset buffer" })
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "gitsigns preview hunk" })
-- map("n", "<leader>gi", gitsigns.preview_hunk_inline)

-- map("n", "<leader>gb", function()
--   gitsigns.blame_line { full = true }
-- end)

map("n", "<leader>gd", gitsigns.diffthis, { desc = "gitsigns diff this" })

-- map("n", "<leader>gD", function()
--   gitsigns.diffthis "~"
-- end)
--
map("n", "<leader>gQ", function()
  gitsigns.setqflist "all"
end, { desc = "gitsigns hunks to quickfix" })
-- map("n", "<leader>gq", gitsigns.setloclist, { desc = "Hunk to quickfix" })

-- CodeCompanion
map({ "n", "v" }, "<C-c>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
map({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cab cc CodeCompanion]]

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
