-- https://github.com/nvim-lualine/lualine.nvim

return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'tokyonight-night'
            }
        })
    end
}
