return {
    {
        "rcarriga/nvim-notify",
        config = function ()
            local notify = require('notify')

            vim.notify = notify

            notify.setup({
                background_colour = "NotifyBackground",
                max_width = 90,
                minimum_width = 50,
                max_height = 6,
                icons = {
                    DEBUG = "",
                    ERROR = "",
                    INFO = "",
                    TRACE = "✎",
                    WARN = ""
                },
                level = 2,
                render = "minimal",
                fps = 30,
                stages = "fade_in_slide_out",
                timeout = 500,
                top_down = false,

            })
        end
    }
}
