return {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function ()
        local obsidian = require('obsidian')

        obsidian.setup({
            workspaces = {
                {
                    name = "Vault",
                    path = "~/Documents/Documents/Vault/",
                }
            },
            follow_url_func = function (url)
                vim.cmd(':silent exec "!start ' .. url .. '"')
            end,
        })
    end
}
