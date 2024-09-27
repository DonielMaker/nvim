require("settings.lazy")
require("settings.options")

local keymap = vim.keymap.set

keymap("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

keymap("n", "<leader>tv", "<C-w>v", { desc = "Split window vertically"})
keymap("n", "<leader>th", "<C-w>s", { desc = "Split window horizontally"})
keymap("n", "<leader>tx", "<cmd>close<CR>", { desc = "Close current window"})

keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal"})

keymap("n", "<C-Up>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate Up"})
keymap("n", "<C-Down>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate Down"})
keymap("n", "<C-Left>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate Left"})
keymap("n", "<C-Right>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate Right"})
