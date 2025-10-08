return {
    {
        'saghen/blink.cmp',
        build = "cargo build --release",
        version = "1.6.0",

        opts = {
            keymap = {
                ["<Up>"] = {"select_prev", "fallback"},
                ["<Down>"] = {"select_next", "fallback"},
                ["<C-Space>"] = {"show", "show_documentation", "hide_documentation"},
                ["<C-Enter>"] = {"select_and_accept", "fallback"},
            },

            appearance = {
                nerd_font_variant = 'normal'
            },

            completion = {
                documentation = { auto_show = false },

                ghost_text = {enabled = false},
            },

            signature = { enabled = true },

            fuzzy = { implementation = "lua" },

        },
    },
}
