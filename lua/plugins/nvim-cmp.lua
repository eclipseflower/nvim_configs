return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<Tab>"] = LazyVim.cmp.confirm({ select = true }),
        })
    end,
}
