return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            -- import mason
            local mason = require("mason")

            -- import mason-lspconfig
            local mason_lspconfig = require("mason-lspconfig")

            local mason_tool_installer = require("mason-tool-installer")

            -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                    -- Webdev
                    "html",
                    "cssls",
                    "ts_ls",

                    -- Lua
                    "lua_ls",

                    -- Rust
                    "rust_analyzer",
                    "typst_lsp",
                },
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    "stylua", -- lua formatter
                },
            })
        end,
    }
}
