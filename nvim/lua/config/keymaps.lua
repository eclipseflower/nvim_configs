-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map('n', 'c', '"cc')
map('n', 'C', '"cC')
map('n', 'd', '"dd')
map('n', 'D', '"dD')
map('n', 'x', '"xx')
map('n', 'X', '"xX')

map({ "i", "x", "s", "c" }, "<c-v>", "<c-r>*", { desc = "Paste" })
