local bufferline_go_to_cmd_format = '<cmd>lua require("bufferline").go_to(%d, true)<cr>'

local keys = {
    { "gT", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "gt", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>to", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
    { "<leader>tc", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader><c-e>", "<cmd>!start explorer /select,%:p<cr>", desc = "Open In System Explorer" },
    { "<leader>tf", string.format(bufferline_go_to_cmd_format, 1), desc = "First Buffer" },
    { "<leader>tl", string.format(bufferline_go_to_cmd_format, -1), desc = "Last Buffer" },
}

for i = 1, 9 do
    keys[#keys + 1] = { string.format("%dgt", i), string.format(bufferline_go_to_cmd_format, i), desc = "Go to Buffer " .. i }
end

return {
    "akinsho/bufferline.nvim",
    keys = keys,
}
