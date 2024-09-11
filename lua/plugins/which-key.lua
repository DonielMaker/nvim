return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>s", group = "search"},
            { "<leader>f", group = "file explorer"},
            { "<leader>c", group = "clear"},
            { "<leader>x", group = "trouble"},
            { "<leader>t", group = "terminal"},
        })
    end
}
