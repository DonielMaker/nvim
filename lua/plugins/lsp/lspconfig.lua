return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- 'hrsh7th/cmp-nvim-lsp',
            {
                'folke/lazydev.nvim',
                ft = "lua",
                opts = {
                    library = {
                        {path = "${3rd}/luv/library", words = {"vim%.uv"}},
                    }
                }
            }
        },

        opts = {
            servers = {
                lua_ls = {},
                rust_analyzer = {},
                nil_ls = {},
                ts_ls = {},
                cssls = {},
                bashls = {},
            }
        },

        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Creates icons at the left side
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Create lsp based on settings defined in opts
            for server, config in pairs(opts.servers) do
                config.capabilities = capabilities
                lspconfig[server].setup{config}
            end
        end
    }
}
