-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/famiu/bufdelete.nvim

return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "ordinal",
                    close_command = "Bdelete %d",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left",
                            separator = false,
                        }
                    },
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end
                },
            })
        end
    },
    {
        "famiu/bufdelete.nvim"
    },
}
