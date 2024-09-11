return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'folke/todo-comments.nvim',
            --{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make"},
        },
        config = function()
            local telescope = require("telescope")


            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    file_ignore_patterns = {
                        "target"
                    },
                },
            })

            local keymap = vim.keymap.set -- for consiceness

            keymap("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Search files"})
            keymap("n", "<leader>sg", "<cmd>Telescope git_files<cr>", { desc = "Search git files"})
            keymap("n", "<leader>sr", "<cmd>Telescope live_grep<cr>", { desc = "Live grep"})
        end
    }
}
