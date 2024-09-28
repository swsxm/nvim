require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "kj", "<C-\\><C-N>", { desc = "exit terminal mode with kj" })
map("n", "<S-L>", "<C-w>l", { desc = "Move to right split" })
map("n", "<S-R>", "<C-w>h", { desc = "Move to left split" })
map("n", "<S-U>", "<C-w>k", { desc = "Move to upper split" })
map("n", "<S-D>", "<C-w>j", { desc = "Move to lower split" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
