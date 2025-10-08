return {
    {
        'folke/trouble.nvim',
        event = 'BufReadPre',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'folke/todo-comments.nvim',
        },
        config = function ()
            local trouble = require("trouble")

            trouble.setup({
                focus = true,
            })

            local keymap = vim.keymap.set

            keymap("n", "<leader>xd", "<cmd>Trouble diagnostics filter.buf=0<CR>", { desc = "Open trouble document diagnostics"})
            -- keymap("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })
        end,
    }
}
