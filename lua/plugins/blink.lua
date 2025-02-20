return {
    {
        'saghen/blink.cmp',
        -- dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.12.0',

        opts = {
            keymap = {
                ["<Up>"] = {"select_prev", "fallback"},
                ["<Down>"] = {"select_next", "fallback"},
                ["<C-Space>"] = {"show", "show_documentation", "hide_documentation"},
                ["<Tab>"] = {"select_and_accept", "fallback"},
                -- ["<C-CR>"] = {"select_and_accept", "fallback"},
            },

            appearance = {
                -- use_nvim_cmp_as_default = true,
                nerd_font_variant = 'normal'
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },

                ghost_text = {enabled = true,},
            },

            signature = { enabled = true }
        },

        opts_extend = { "sources.default" }
    },
}
