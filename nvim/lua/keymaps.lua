local opts = {
    noremap = true
}

local reload_modules = {
    ["keymaps"] = true,
    ["options"] = true,
    ["plugin-manager"] = true
}
local function reload_config()
    for name, _ in pairs(package.loaded) do
        if reload_modules[name] then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

-- normal
vim.keymap.set('n', '<leader><c-r>', reload_config, opts)
vim.keymap.set('n', '<c-s>', ':w<CR>', opts)
vim.keymap.set('n', 'c', '"cc', opts)
vim.keymap.set('n', 'C', '"cC', opts)
vim.keymap.set('n', 'd', '"dd', opts)
vim.keymap.set('n', 'D', '"dD', opts)
vim.keymap.set('n', 'x', '"xx', opts)
vim.keymap.set('n', 'X', '"xX', opts)
-- nvim-tree
vim.keymap.set('n', '<leader>ft', ':NvimTreeFindFileToggle<CR>', opts)
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFile<CR>', opts)
-- bufferline
vim.keymap.set('n', 'gt', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', 'gT', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<leader>to', ':BufferLineCloseOthers<CR>', opts)
vim.keymap.set('n', '<leader>t0', ':BufferLineCloseLeft<CR>', opts)
vim.keymap.set('n', '<leader>t$', ':BufferLineCloseRight<CR>', opts)

local bufferline_go_to_cmd_format = '<cmd>lua require("bufferline").go_to(%d, true)<CR>'
vim.keymap.set('n', '<leader>tf', string.format(bufferline_go_to_cmd_format, 1), opts)
vim.keymap.set('n', '<leader>tl', string.format(bufferline_go_to_cmd_format, -1), opts)

for i = 1, 9 do
    vim.keymap.set('n', string.format('%dgt', i), string.format(bufferline_go_to_cmd_format, i), opts)
end
-- bufdelete
vim.keymap.set('n', '<leader>tc', ':Bdelete<CR>', opts)
-- nvim-telescope
vim.keymap.set('n', '<c-f>', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<c-p>', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader><c-f>', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader><c-w>', ':Telescope grep_string<CR>', opts)

-- insert
vim.keymap.set('i', '<c-s>', '<c-[>:w<CR>', opts)

