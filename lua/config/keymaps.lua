-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- normal mode
map("n", "c", '"cc', { desc = "Change" })
map("n", "C", '"cC', { desc = "Change" })
map("n", "d", '"dd', { desc = "Delete" })
map("n", "D", '"dD', { desc = "Delete" })
map("n", "x", '"xx', { desc = "Delete Char" })
map("n", "X", '"xX', { desc = "Delete Char" })

local rd_str_format = "<cmd>!rd /s/q %s<cr>"
map("n", "<leader>qD", string.format(rd_str_format, vim.fn.stdpath("data") .. "\\shada"), { desc = "Delete All Sessions" })

-- svn keymaps
map("n", "<leader>vc", function()
    vim.system({ "TortoiseProc", "/command:commit", string.format("/path:%s", vim.fn.expand("%:p")) })
end, { expr = true, desc = "SVN Commit (buffer)" })
map("n", "<leader>vC", function()
    vim.system({ "TortoiseProc", "/command:commit", string.format("/path:%s", vim.fn.getcwd()) })
end, { desc = "SVN Commit (cwd)" })
map("n", "<leader>vu", "<cmd>!svn update %:p<cr>", { desc = "SVN Update (buffer)" })
map("n", "<leader>vU", "<cmd>!svn update<cr>", { desc = "SVN Update (cwd)" })
map("n", "<leader>vr", "<cmd>!svn revert %:p<cr>", { desc = "SVN Revert (buffer)" })
map("n", "<leader>vR", "<cmd>!svn revert<cr>", { desc = "SVN Revert (cwd)" })
map("n", "<leader>vl", function()
    vim.system({ "TortoiseProc", "/command:log", string.format("/path:%s", vim.fn.expand("%:p")) })
end, { desc = "SVN Log (buffer)" })
map("n", "<leader>vb", function()
    local revision = vim.fn.system("svn info --show-item revision")
    vim.system({ "TortoiseProc", "/command:blame", string.format("/path:%s", vim.fn.expand("%:p")), string.format("/rev:%s", revision) })
end, { expr = true, desc = "SVN Blame (buffer)" })
map("n", "<leader>vd", function()
    vim.system({ "TortoiseProc", "/command:diff", string.format("/path:%s", vim.fn.expand("%:p")) })
end, { desc = "SVN Diff (buffer)" })

-- terminal mode
map("t", "<c-v>", "<c-\\><c-n>pi", { desc = "Paste" })

-- other mode
map({ "i", "x", "s", "c" }, "<c-v>", "<c-r>*", { desc = "Paste" })
