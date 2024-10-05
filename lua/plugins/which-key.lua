return {
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>s", group = "Search"},
                { "<leader>f", group = "File explorer"},
                { "<leader>c", group = "Clear"},
                { "<leader>x", group = "Trouble"},
                { "<leader>t", group = "Terminal"},
            })
        end
    }
}
