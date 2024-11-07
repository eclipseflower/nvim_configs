return {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<c-p>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
}
