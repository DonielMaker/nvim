return {
    {
        'windwp/nvim-autopairs',
        event = { "InsertEnter" },
        dependencies = { 'saghen/blink.cmp' },

        config = function()
            local autopairs = require("nvim-autopairs")

            autopairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { "string" },
                    javascript = { "template_string" },
                },
            })

            -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            -- local blink = require("blink.cmp")
            --
            -- blink.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    }
}
