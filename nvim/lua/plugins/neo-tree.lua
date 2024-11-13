return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>fo", "<cmd>:Neotree toggle<cr>", desc = "open neo tree" },
    },
    opts = {
        filesystem = {
            bind_to_cwd = true,
        },
    },
}
