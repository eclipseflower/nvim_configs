-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

return {
    {
        "williamboman/mason.nvim",
        enabled = true,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = true,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "omnisharp" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        enabled = true,
        config = function()
            local lspconfig = require('lspconfig')
            local bin_path = vim.fn.stdpath("data") .. "/mason/bin/"
            local pkg_path = vim.fn.stdpath("data") .. "/mason/packages/"

            require('lspconfig').lua_ls.setup({
                cmd = { bin_path .. "lua-language-server.cmd" },
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Both',
                            keywordSnippet = 'Both',
                        },
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            maxPreload = 1,
                            checkThirdParty = false,
                            ignoreDir = {
                                '.svn',
                                '.git',
                                '.vscode',
                            },
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                }
            })
        end
    }
}
