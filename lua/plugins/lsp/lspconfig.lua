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
                marksman = {},
                -- texlab = {},
                nixd = {},
                lua_ls = {},
                rust_analyzer = {},
                ts_ls = {},
                cssls = {
                    settings = {
                        css = { validate = true; },
                        scss = { validate = true; },
                        less = { validate = true; },
                    }
                },
                bashls = {},
            }
        },

        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local keymap = vim.keymap.set

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf, silent = true }

                    opts.desc = "Show LSP references"
                    keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                    opts.desc = "Go to declaration"
                    keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                    opts.desc = "Show LSP definitions"
                    keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                    opts.desc = "Show LSP implementations"
                    keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                    opts.desc = "Show LSP type definitions"
                    keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                    opts.desc = "See available code actions"
                    keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                    opts.desc = "Show documentation for what is under cursor"
                    keymap("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                    opts.desc = "Rename all occurences"
                    keymap("n", "gr", vim.lsp.buf.rename, opts)
                end,
            })


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
