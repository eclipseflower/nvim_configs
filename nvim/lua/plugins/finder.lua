-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/ibhagwan/fzf-lua
-- https://github.com/junegunn/fzf

return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<c-[>"] = actions.close,
                        },
                    },
                    preview = false
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        preview = false,
                    },
                    live_grep = {
                        preview = true,
                    },
                    grep_string = {
                        preview = true,
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    }
                },
            })

            local telescope = require("telescope")
            telescope.load_extension('fzf')
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },
    {
        "junegunn/fzf",
        build = "./install --bin"
    }
}
