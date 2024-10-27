return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPre', 'BufNewFile' },
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.install').compilers = {'zig'}
            -- import nvim-treesitter plugin
            local treesitter = require('nvim-treesitter.configs')

            -- configure treesitter
            treesitter.setup({
                -- makes trouble.nvim stop crying
                modules = {},
                -- enable syntax highlighting
                highlight = { enable = true, },
                -- enable indentation
                indent = { enable = true },
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
                -- List of parsers to ignore installing (or "all")
                ignore_install = {},
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- ensure these language parsers are installed
                ensure_installed = {
                    "json",
                    "javascript",
                    "tsx",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "gitignore",
                    "query",
                    "c",
                    "rust",
                    "slint",
                    "regex",
                    "slint",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
            vim.treesitter.language.register("bash","zsh")
        end,
    }
}
