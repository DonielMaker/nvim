return {
    {
        'christoomey/vim-tmux-navigator',
        event = "BufReadPre",
        config = function ()
            local keymap = vim.keymap.set

            keymap("n", "<C-Up>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate Up"})
            keymap("n", "<C-Down>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate Down"})
            keymap("n", "<C-Left>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate Left"})
            keymap("n", "<C-Right>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate Right"})
        end
    }
}
