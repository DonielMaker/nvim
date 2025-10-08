return {
    {
        'stevearc/oil.nvim',
        -- ---@module 'oil'
        -- ---@type oil.SetupOpts
        -- opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function ()
            local oil = require("oil")

            local keymap = vim.keymap.set

            keymap("n", "<leader>ff", "<CMD>Oil<CR>", {desc = "Open parent dir"})

            oil.setup({
                default_file_explorer = true,

                columns = {
                    "icon",
                    "permissions",
                },
                --
                buf_options = {
                    buflisted = false,
                    bufhidden = "hide",
                },
                win_options = {
                    wrap = false,
                    signcolumn = "no",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 3,
                    concealcursor = "nvic",
                },
                delete_to_trash = false,
                skip_confirm_for_simple_edits = true,
                prompt_save_on_select_new_entry = true,
                cleanup_delay_ms = 2000,
                lsp_file_methods = {
                    enabled = true,
                    timeout_ms = 1000,
                    autosave_changes = false,
                },
                constrain_cursor = "editable",
                watch_for_changes = false,
                keymaps = {
                    ["<leader>ff"] = {"actions.close", mode = "n"},
                    ["g?"] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = { "actions.close", mode = "n" },
                    -- ["<C-l>"] = "actions.refresh",
                    -- ["-"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["gx"] = "actions.open_external",
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                },

                use_default_keymaps = false,
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true,
                    -- This function defines what is considered a "hidden" file
                    is_hidden_file = function(name, bufnr)
                        local m = name:match("^%.")
                        return m ~= nil
                    end,
                    -- This function defines what will never be shown, even when `show_hidden` is set
                    is_always_hidden = function(name, bufnr)
                        return false
                    end,

                    natural_order = "fast",

                    case_insensitive = false,

                    sort = {
                        { "type", "asc" },
                        { "name", "asc" },
                    },
                    -- Customize the highlight group for the file name
                    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                        return nil
                    end,
                },

                extra_scp_args = {},

                -- Configuration for the file preview window
                preview_win = {

                    update_on_cursor_moved = true,

                    preview_method = "fast_scratch",

                    -- A function that returns true to disable preview on a file e.g. to avoid lag
                    disable_preview = function(filename)
                        return false
                    end,
                },
                ssh = {
                    border = "rounded",
                },

                keymaps_help = {
                    border = "rounded",
                },
            })
        end,
    }
}
