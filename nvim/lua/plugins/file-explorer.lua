-- https://github.com/nvim-tree/nvim-tree.lua

return {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-tree").setup({
            auto_reload_on_write = false,
            filters = { dotfiles = true },
            git = { enable = false },
            view = {
                width = { min = 30, max = -1, padding = 1 }
            },
        })
    end
}
