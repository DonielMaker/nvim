return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'folke/lazydev.nvim', ft = "lua", }
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local capabilitites = cmp_nvim_lsp.default_capabilities()

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            local lsp_servers = {
                "lua_ls",
                "rust_analyzer",
                "nil_ls",
                "ts_ls",
                "cssls",
                "bashls",
            }

            for _, lsp in ipairs(lsp_servers) do
                lspconfig[lsp].setup{capabilitites}
            end
        end
    }
}
