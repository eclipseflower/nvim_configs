-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map('n', 'c', '"cc', { desc = 'Change' })
map('n', 'C', '"cC', { desc = 'Change' })
map('n', 'd', '"dd', { desc = 'Delete' })
map('n', 'D', '"dD', { desc = 'Delete' })
map('n', 'x', '"xx', { desc = 'Delete Char' })
map('n', 'X', '"xX', { desc = 'Delete Char' })

local svn_commit_str_format = '<cmd>!TortoiseProc /command:commit /path:%s<cr>'
map('n', '<leader>vC', string.format(svn_commit_str_format, '%:p'), { desc = 'SVN Commit (buffer)' })
map('n', '<leader>vc', function() return string.format(svn_commit_str_format, vim.fn.getcwd()) end, { expr = true, desc = 'SVN Commit (cwd)' })
map('n', '<leader>vU', '<cmd>!svn update %:p<cr>', { desc = 'SVN Update (buffer)' })
map('n', '<leader>vu', '<cmd>!svn update<cr>', { desc = 'SVN Update (cwd)' })
map('n', '<leader>vl', '<cmd>!TortoiseProc /command:log /path:%:p<cr>', { desc = 'SVN Log (buffer)' })
map('n', '<leader>vb',
    function()
        local revision = vim.fn.system('svn info --show-item revision')
        return string.format('<cmd>!TortoiseProc /command:blame /path:%s /startrev:1 /endrev:%s<cr>', '%:p', revision)
    end,
    { expr = true, desc = 'SVN Blame (buffer)' })

map('t', '<c-v>', '<c-\\><c-n>pi', { desc = 'Paste' })

map({ 'i', 'x', 's', 'c' }, '<c-v>', '<c-r>*', { desc = 'Paste' })
