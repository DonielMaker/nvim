return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function ()
            local term = require('toggleterm')

            term.setup({
                direction = "horizontal",
                size = 25,
                shell = "zsh",
            })

            local keymap = vim.keymap.set

            keymap("t", "<C-Up>", [[<Cmd>wincmd k<CR>]], { desc = "Navigate Up (Terminal)"})
            keymap("t", "<C-Down>", [[<Cmd>wincmd j<CR>]], { desc = "Navigate Down (Terminal)"})
            keymap("t", "<C-Left>", [[<Cmd>wincmd h<CR>]], { desc = "Navigate Up (Terminal)"})
            keymap("t", "<C-Right>", [[<Cmd>wincmd l<CR>]], { desc = "Navigate Up (Terminal)"})
        end,
    }
}
