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

            lspconfig.lua_ls.setup{capabilitites}
            lspconfig.rust_analyzer.setup{capabilitites}
            lspconfig.nil_ls.setup({capabilitites})
        end
    }
}
