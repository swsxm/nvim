require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "kj", "<C-\\><C-N>", { desc = "exit terminal mode with kj" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
