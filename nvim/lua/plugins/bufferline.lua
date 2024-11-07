local keys = {
    { "gT", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "gt", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>to", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
    { "<leader>tc", LazyVim.ui.bufremove, desc = "Delete Buffer" },
    { "<leader><c-e>", "<cmd>!start explorer /select,%:p<cr>", desc = "Open In System Explorer" }
}
local bufferline_go_to_cmd_format = '<cmd>lua require("bufferline").go_to(%d, true)<cr>'
for i = 1, 9 do
    keys[#keys + 1] = { string.format("%dgt", i), string.format(bufferline_go_to_cmd_format, i) }
end

return {
    "akinsho/bufferline.nvim",
    keys = keys,
}
