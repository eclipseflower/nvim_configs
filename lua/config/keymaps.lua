-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- normal mode
map("n", "c", '"cc', { desc = "Change" })
map("n", "C", '"cC', { desc = "Change" })
map("n", "d", '"dd', { desc = "Delete" })
map("n", "D", '"dD', { desc = "Delete" })
map("n", "x", '"xx', { desc = "Delete Char" })
map("n", "X", '"xX', { desc = "Delete Char" })

local rd_str_format = "<cmd>!rd /s/q %s<cr>"
map("n", "<leader>qD", string.format(rd_str_format, vim.fn.stdpath("data") .. "\\shada"), { desc = "Delete All Sessions" })

-- svn keymaps
map("n", "<leader>vc", function()
    vim.system({ "TortoiseProc", "/command:commit", string.format("/path:%s", vim.fn.expand("%:p")) })
end, { expr = true, desc = "SVN Commit (buffer)" })
map("n", "<leader>vC", function()
    vim.system({ "TortoiseProc", "/command:commit", string.format("/path:%s", vim.fn.getcwd()) })
end, { desc = "SVN Commit (cwd)" })
map("n", "<leader>vu", "<cmd>!svn update %:p<cr>", { desc = "SVN Update (buffer)" })
map("n", "<leader>vU", "<cmd>!svn update<cr>", { desc = "SVN Update (cwd)" })
map("n", "<leader>vr", "<cmd>!svn revert %:p<cr>", { desc = "SVN Revert (buffer)" })
map("n", "<leader>vR", "<cmd>!svn revert<cr>", { desc = "SVN Revert (cwd)" })
map("n", "<leader>vl", function()
    vim.system({ "TortoiseProc", "/command:log", string.format("/path:%s", vim.fn.expand("%:p")) })
end, { desc = "SVN Log (buffer)" })
map("n", "<leader>vb", function()
    local revision = vim.fn.system("svn info --show-item revision")
    vim.system({ "TortoiseProc", "/command:blame", string.format("/path:%s", vim.fn.expand("%:p")), string.format("/rev:%s", revision) })
end, { expr = true, desc = "SVN Blame (buffer)" })

-- lsp keymaps
local function toggle_lsp()
    return Snacks.toggle({
        name = "Lsp (buffer)",
        get = function()
            local buf = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_clients({ bufnr = buf })
            local activeMap = {}
            for _, client in ipairs(clients) do
                activeMap[client.name] = true
            end

            local ft = vim.o.ft
            local lspconfig = require("lspconfig")
            local servers = lspconfig.util.available_servers()
            local count = 0
            for _, serverName in pairs(servers) do
                if activeMap[serverName] then
                    local server = lspconfig[serverName]
                    if server.filetypes and vim.tbl_contains(server.filetypes, ft) then
                        count = count + 1
                    end
                end
            end
            return count > 0
        end,
        set = function(state)
            local buf = vim.api.nvim_get_current_buf()
            if state then
                local ft = vim.o.ft
                local lspconfig = require("lspconfig")
                local servers = lspconfig.util.available_servers()
                for _, serverName in pairs(servers) do
                    local server = lspconfig[serverName]
                    if server.filetypes and vim.tbl_contains(server.filetypes, ft) then
                        vim.lsp.start(server)
                    end
                end
            else
                local clients = vim.lsp.get_clients({ bufnr = buf })
                for _, client in ipairs(clients) do
                    vim.lsp.buf_detach_client(buf, client.id)
                end
            end
        end,
    })
end

toggle_lsp():map("<leader>ux")

-- terminal mode
map("t", "<c-v>", "<c-\\><c-n>pi", { desc = "Paste" })

-- other mode
map({ "i", "x", "s", "c" }, "<c-v>", "<c-r>*", { desc = "Paste" })
