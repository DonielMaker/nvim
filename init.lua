vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.swapfile = false
vim.o.wrap = false

vim.o.tabstop = 4
vim.o.shiftwidth = 0 -- 0 spaces for indent width
vim.o.expandtab = true -- expand tab to spaces
vim.o.autoindent = true -- copy indent from current line when starting new one

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom

vim.o.clipboard = "unnamedplus"

vim.pack.add({
    {src = "https://github.com/folke/tokyonight.nvim"},
    {src = "https://github.com/nvim-tree/nvim-web-devicons"},
    {src = "https://github.com/windwp/nvim-autopairs"},
    {src = "https://github.com/windwp/nvim-ts-autotag"},
    {src = "https://github.com/nvim-lualine/lualine.nvim"},
    {src = "https://github.com/nvim-treesitter/nvim-treesitter"},
    {src = "https://github.com/folke/which-key.nvim"},
    {src = "https://github.com/folke/trouble.nvim"},
    {src = "https://github.com/ibhagwan/fzf-lua"},
    {src = "https://github.com/stevearc/oil.nvim"},
    {src = "https://github.com/folke/lazydev.nvim"},
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/saghen/blink.cmp"},
    {src = "https://github.com/stevearc/dressing.nvim"},
})

vim.cmd.colorscheme "tokyonight-storm"

require("nvim-web-devicons").setup()

require("nvim-ts-autotag").setup({
    opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true -- Auto close on trailing </
    }
})

require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
    },
})

require("lualine").setup({
    options = { theme = "tokyonight-storm" }
})

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

require("trouble").setup({ focus = true, })

require("fzf-lua").setup({
    winopts = {
        backdrop = 100,
        fullscreen = true,
    }
})

require("oil").setup({
    skip_confirm_for_simple_edits = true,

    prompt_save_on_select_new_entry = true,

    keymaps = {
        ["<leader>ff"] = {"actions.close", mode = "n"},
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
    },

    use_default_keymaps = false,
    view_options = {
        show_hidden = true,
        -- is_hidden_file = function(name, bufnr)
        --     local m = name:match("^%.")
        --     return m ~= nil
        -- end,

        -- is_always_hidden = function(name, bufnr)
        --     return false
        -- end,
    },
})

require("lazydev").setup()

-- Create all the left side icons based on their severity
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
-- keymap("n", "<leader>dd", function() require("snacks").dashboard() end, { desc = "load the dashboard"})
