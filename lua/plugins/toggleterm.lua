return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function ()
            local term = require('toggleterm')

            term.setup({
                direction = "vertical",
                size = 120,
            })
        end,
    }
}
