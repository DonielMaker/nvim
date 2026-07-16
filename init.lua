-- == General Configuration ==
vim.g.mapleader = " " -- Space as Leader 
vim.g.maplocalleader = " " -- Space as Localleader

vim.o.number = true -- Shows linenumbers
vim.o.relativenumber = true -- Shows linenumbers relative to current

vim.o.swapfile = false -- No Swapfiles

vim.o.wrap = false -- Text doesn't wrap when exceeding width

vim.o.tabstop = 4 -- 4 Space tab
vim.o.shiftwidth = 0 -- 0 spaces for indent width
vim.o.expandtab = true -- expand tab to spaces
vim.o.autoindent = true -- copy indent from current line when starting new one

vim.o.ignorecase = true
vim.o.smartcase = true -- ignorecase until capitalising

vim.o.cursorline = true -- Highlights the whole line the cursor is on

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom

vim.o.clipboard = "unnamedplus" -- Combines Vim clipboard with System clipboard

vim.keymap.set("n", "<Esc>", "<cmd>nohl<cr>", { desc = "Clear search highlights" })

-- == LSP ==
local servers = {
    marksman = {},
    tinymist = {},
    yamlls = {},
    nixd = {},
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        }
    },
    rust_analyzer = {},
    vtsls = {},
    cssls = {
        settings = {
            css = { validate = true; },
            scss = { validate = true; },
            less = { validate = true; },
        }
    },
    bashls = {},
    qmlls = {},
}

-- Create lsp based on settings defined in servers
for server, config in pairs(servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

-- Create all the diagnostic icons based on their severity
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
        }
    }
})

-- Show current diagnostic
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

-- == Autocompletion ==
vim.o.autocomplete = true
vim.o.completeopt = { 'menuone', 'noselect', } -- Always show menu, do not preselect an option
vim.o.complete = "o"
vim.o.pumheight = 7 -- Show n Entries in the Menu

-- Enable LSP Autocompletion
vim.api.nvim_create_autocmd( 'LspAttach', {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
    end
})

-- == Terminal ==
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "Exit Terminal Mode" })

-- Open Terminal in nvim
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_resize(0, -1, 20, {})
    vim.cmd.startinsert()
end, { desc = "Open Terminal in the bottom" })

-- Remove Line Numbers in Terminals
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Remove Line Numbers in Terminals",
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function ()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- == Plugins ==
vim.pack.add({
    -- Configuration
    {src = "https://github.com/folke/tokyonight.nvim"}, -- Theme
    {src = "https://github.com/nvim-tree/nvim-web-devicons"}, -- Nerdicons

    {src = "https://github.com/nvim-lua/plenary.nvim"}, -- Plugin Dependency

    -- Do i even use the features of this? Check if some problem occurs and if not remove it.
    -- {src = "https://github.com/nvim-treesitter/nvim-treesitter"}, -- Code parsing
    {src = "https://github.com/folke/which-key.nvim"}, -- Keybind Cheatsheet
    {src = "https://github.com/ibhagwan/fzf-lua"}, -- Fuzzyfinder
    {src = "https://github.com/neovim/nvim-lspconfig"}, -- Preconfigured Lsps
    {src = "https://github.com/nvim-lualine/lualine.nvim"}, -- Bottom bar
    {src = "https://github.com/stevearc/oil.nvim"}, -- File explorer with vim bindings
    -- {src = "https://github.com/windwp/nvim-ts-autotag"}, -- Html tag pairing
    {src = "https://github.com/windwp/nvim-autopairs"}, -- Parentheses pairing

    -- Utils
    {src = "https://github.com/chomosuke/typst-preview.nvim"}, -- Typst live preview
    {src = "https://github.com/epwalsh/obsidian.nvim"}, -- Obsidian interactivity
})

vim.cmd.colorscheme "tokyonight-storm"

-- == Nerdicons ==
require("nvim-web-devicons").setup()

-- == Auto Html tags == (Not constantly needed. Might need to add some sort of autocmd)
-- require("nvim-ts-autotag").setup({
--     opts = {
--         enable_close = true, -- Auto close tags
--         enable_rename = true, -- Auto rename pairs of tags
--         enable_close_on_slash = true -- Auto close on trailing </
--     }
-- })

-- == Auto brackets and quotes ==
require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
    },
})

-- == Better bottom line ==
require("lualine").setup( { options = { theme = "tokyonight-storm" } } )

-- == Show Keybinds ==
require("which-key").setup({

    preset = "modern",
    win = { border = "none"},
})

require("which-key").add({

    { "<leader>s", group = "Search", icon = ""},
    { "<leader>f", group = "File explorer"},
    { "<leader>t", group = "Panes", icon = ""},
    { "<leader>o", group = "Obsidian", icon = "󱨠"},
})

-- == Fuzzy finder ==
require("fzf-lua").setup({

    winopts = {
        backdrop = 100,
        fullscreen = true,
    }
})

vim.keymap.set("n", "<leader>ss", "<cmd>FzfLua<cr>", { desc = "FzfLua" })
vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sr", "<cmd>FzfLua grep<cr>", { desc = "Grep Files" })
vim.keymap.set("n", "<leader>sc", "<cmd>FzfLua files cwd=~/.config<cr>", { desc = "Search .config" })

-- == Tui File Explorer with Vim Buffers ==
require("oil").setup({

    skip_confirm_for_simple_edits = true,

    prompt_save_on_select_new_entry = true,

    keymaps = {
        ["<leader>ff"] = {"actions.close", mode = "n"},
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<CR>"] = "actions.select",

        ["g?"] = { "actions.show_help", mode = "n" },
        ["<C-p>"] = "actions.preview",
        ["-"] = { "actions.parent", mode = "n" },
        ["g."] = { "actions.toggle_hidden", mode = "n" },
    },

    use_default_keymaps = false,
    view_options = { show_hidden = true, }, -- Show hidden files (.something)
})

vim.keymap.set("n", "<leader>ff", "<cmd>Oil<cr>")

-- == Typst-preview ==
require("typst-preview").setup({

    -- Necessary for NixOS. Don't ask why
    extra_args = { "--verbose" },
    dependencies_bin = {
        tinymist = "tinymist",
        websocat = "websocat",
    },
})

-- == Obsidian ==
require("obsidian").setup({

    ui = { enable = false },

    workspaces = {

        {
            name = "notes",
            path = "~/Documents/notes/",
        },
    },

    mappings = {

        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
            action = function()
                return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
        }
    },

    -- Creates note with 12 random digits (385018402918)
    note_id_func = function()

        local suffix = ""

        for _ = 1, 12 do
            suffix = suffix .. string.char(math.random(48, 57))
        end

        return suffix
    end,
})

vim.keymap.set("n", "<leader>so", "<cmd>ObsidianSearch<cr>")
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>")
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>")
