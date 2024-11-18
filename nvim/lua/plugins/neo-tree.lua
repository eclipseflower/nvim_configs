return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>fo", "<cmd>:Neotree focus<cr>", desc = "focus neo tree" },
    },
    opts = {
        filesystem = {
            bind_to_cwd = true,
        },
    },
}
