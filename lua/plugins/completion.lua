return {
    {
        'saghen/blink.cmp',
        version = 'v0.*',

        opts = {
            keymap = {
                ["<Up>"] = {"select_prev", "fallback"},
                ["<Down>"] = {"select_next", "fallback"},
                ["<C-Space>"] = {"show", "show_documentation", "hide_documentation"},
                ["<C-CR>"] = {"select_and_accept", "fallback"},
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'normal'
            },

            signature = { enabled = true }
        },

        opts_extend = { "sources.default" }
    },
}
