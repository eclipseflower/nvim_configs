-- UnrealBuildTool.exe -mode=GenerateClangDatabase -Target=UnrealEditor Development Win64

return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            maxPreload = 100,
                        },
                    },
                },
            },

            pyright = {
                root_dir = function(fname)
                    local util = require "lspconfig.util"
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
        },
    },
}
