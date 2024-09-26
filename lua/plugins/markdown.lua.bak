return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
        local markdown = require('render-markdown')

        markdown.enable()
        markdown.expand()

        local keymap = vim.keymap.set

        keymap('n', '<leader>mm', "<cmd> RenderMarkdown toggle <CR>", { desc = "Toggle Markdown Renderer"})
    end,
}
