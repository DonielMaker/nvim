require("settings.lazy")
require("settings.options")

local keymap = vim.keymap.set

keymap("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

keymap("n", "<leader>tv", "<C-w>v", { desc = "Split window vertically"})
keymap("n", "<leader>th", "<C-w>s", { desc = "Split window horizontally"})
keymap("n", "<leader>tx", "<cmd>close<CR>", { desc = "Close current window"})

keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal"})
