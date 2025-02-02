return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'folke/todo-comments.nvim',
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    file_ignore_patterns = {
                        "target"
                    },
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.99,
                        height = 0.99,
                        prompt_position = "bottom",
                    },
                    -- border = false,
                    mappings = {
                        i = {
                            ["<C-Up>"] = actions.preview_scrolling_up,
                            ["<C-Down>"] = actions.preview_scrolling_down,
                        },
                        n = {
                            ["<C-Up>"] = actions.preview_scrolling_up,
                            ["<C-Down>"] = actions.preview_scrolling_down,
                        },
                    }
                },
            })

            local keymap = vim.keymap.set -- for consiceness

            keymap("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Search files"})
            keymap("n", "<leader>sr", "<cmd>Telescope live_grep<cr>", { desc = "Live grep"})
            keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Live grep"})
            keymap("n", "<leader>sn", "<cmd>Telescope noice<cr>", { desc = "Search notifications"})
        end
    }
}
