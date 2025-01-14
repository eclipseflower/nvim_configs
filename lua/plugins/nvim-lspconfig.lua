-- UnrealBuildTool.exe -mode=GenerateClangDatabase -Target=UnrealEditor Development Win64

local util = require "lspconfig.util"

return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            lua_ls = {
                autostart = false,
                settings = {
                    Lua = {
                        workspace = {
                            maxPreload = 100,
                        },
                    },
                },
            },

            pyright = {
                autostart = false,
                root_dir = function(fname)
                    local root_files = {
                        "pyproject.toml",
                        "setup.py",
                        "setup.cfg",
                        "requirements.txt",
                        "Pipfile",
                        "pyrightconfig.json",
                        ".git",
                        ".svn",
                    }
                    return util.root_pattern(unpack(root_files))(fname)
                end,
            },

            omnisharp = {
                autostart = false,
                root_dir = util.root_pattern('*.sln', '*.csproj', 'omnisharp.json', 'function.json', ".svn"),
            },

            clangd = {
                autostart = false,
            },
        },
    },
}
