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

vim.pack.add({
    {src = "https://github.com/folke/tokyonight.nvim"}, -- Theme
    {src = "https://github.com/nvim-tree/nvim-web-devicons"}, -- Nerdicons
    {src = "https://github.com/windwp/nvim-autopairs"}, -- Parentheses pairing
    {src = "https://github.com/windwp/nvim-ts-autotag"}, -- Html tag pairing
    {src = "https://github.com/nvim-lualine/lualine.nvim"}, -- Bottom bar
    {src = "https://github.com/nvim-treesitter/nvim-treesitter"}, -- Code parsing
    {src = "https://github.com/folke/which-key.nvim"}, -- Keybind Cheatsheet
    {src = "https://github.com/folke/trouble.nvim"}, -- Error util
    {src = "https://github.com/ibhagwan/fzf-lua"}, -- Fuzzyfinder
    {src = "https://github.com/stevearc/oil.nvim"}, -- File explorer with vim bindings
    {src = "https://github.com/folke/lazydev.nvim"}, -- Lua Lsp vim runtime
    {src = "https://github.com/neovim/nvim-lspconfig"}, -- Preconfigured Lsps
    {src = "https://github.com/saghen/blink.cmp"}, -- Shit Replace with vim.o.completion
    {src = "https://github.com/saghen/blink.lib"}, -- Shit Replace with vim.o.completion
    {src = "https://github.com/nvim-lua/plenary.nvim"}, -- Plugin Dependency

    {src = "https://github.com/chomosuke/typst-preview.nvim"}, -- Typst live preview
    {src = "https://github.com/epwalsh/obsidian.nvim"}, -- Obsidian interactivity
})

vim.cmd.colorscheme "tokyonight-storm"

-- Nerdicons
require("nvim-web-devicons").setup()

-- Auto Html tags (Not constantly needed)
-- require("nvim-ts-autotag").setup({
--     opts = {
--         enable_close = true, -- Auto close tags
--         enable_rename = true, -- Auto rename pairs of tags
--         enable_close_on_slash = true -- Auto close on trailing </
--     }
-- })

-- Auto brackets and quotes
require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
    },
})

-- Better bottom line
require("lualine").setup({
    options = { theme = "tokyonight-storm" }
})

-- Code highlighting
require("nvim-treesitter.configs").setup({
    modules = {},

    highlight = { enable = true, },

    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
})


-- Show Keybinds
require("which-key").setup({

    preset = "modern",
    win = { border = "rounded" },
})

require("which-key").add({

    { "<leader>s", group = "Search", icon = ""},
    { "<leader>f", group = "File explorer"},
    { "<leader>x", group = "Trouble", icon = ""},
    { "<leader>t", group = "Panes", icon = ""},
})

-- Error logging (Not really used anymore might deprecate)
require("trouble").setup({ focus = true, })

-- Fuzzy finder
require("fzf-lua").setup({
    winopts = {
        backdrop = 100,
        fullscreen = true,
    }
})

-- Tui File Explorer with Vim Buffers
require("oil").setup({
    skip_confirm_for_simple_edits = true,

    prompt_save_on_select_new_entry = true,

    keymaps = {
        ["<leader>ff"] = {"actions.close", mode = "n"},
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["-"] = { "actions.parent", mode = "n" },
        ["g."] = { "actions.toggle_hidden", mode = "n" },
    },

    use_default_keymaps = false,
    view_options = {
        show_hidden = true,
    },
})

require("lazydev").setup()

-- Create all the lsp left side icons based on their severity
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

local servers = {
    marksman = {},
    tinymist = {},
    yamlls = {},
    nixd = {},
    lua_ls = {},
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

-- This sucks ass
require("blink.cmp").setup({

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
})

require("typst-preview").setup({
    -- Necessary for NixOS. Don't ask why
    extra_args = { "--verbose" },
    dependencies_bin = {
        tinymist = "tinymist",
        websocat = "websocat",
    },
})

require("obsidian").setup({
    ui = {
        enable = false
    },

    workspaces = {
        {
            name = "notes",
            path = "~/Documents/notes/",
        },
    },
})

-- Keybinds
vim.keymap.set("n", "<leader>ff", "<cmd>Oil<cr>", {desc = "Open parent dir"})

vim.keymap.set("n", "<Esc>", "<cmd>nohl<cr>", { desc = "Clear search highlights" })

vim.keymap.set("n", "<leader>ss", "<cmd>FzfLua<cr>", { desc = "FzfLua" })
vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sr", "<cmd>FzfLua grep<cr>", { desc = "Grep Files" })
vim.keymap.set("n", "<leader>sc", "<cmd>FzfLua files cwd=~/.config<cr>", { desc = "Search .config" })

vim.keymap.set("n", "<leader>tv", "<C-w>v", { desc = "Split window vertically"})
vim.keymap.set("n", "<leader>th", "<C-w>s", { desc = "Split window horizontally"})
vim.keymap.set("n", "<leader>tx", "<C-w>q", { desc = "Close current window"})

vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up"})
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down"})
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate Left"})
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate Right"})

vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics filter.buf=0<cr>", { desc = "Open trouble document diagnostics"})
