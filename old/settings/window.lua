-------------------------------------------------------------------------------
------------------------------ Window Configuration ---------------------------
-------------------------------------------------------------------------------

local keymap = vim.keymap.set

-- keymap("n")

keymap("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

keymap("n", "<leader>tv", "<C-w>v", { desc = "Split window vertically"})
keymap("n", "<leader>th", "<C-w>s", { desc = "Split window horizontally"})
keymap("n", "<leader>tx", "<C-w>q", { desc = "Close current window"})

keymap("n", "<C-k>", "<C-w>k", { desc = "Navigate Up"})
keymap("n", "<C-j>", "<C-w>j", { desc = "Navigate Down"})
keymap("n", "<C-h>", "<C-w>h", { desc = "Navigate Left"})
keymap("n", "<C-l>", "<C-w>l", { desc = "Navigate Right"})
keymap("n", "<C-= >", "<C-w>=", { desc = "Equal Dimensions"})

keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal"})

keymap("n", "<leader>dd", function() require("snacks").dashboard() end, { desc = "load the dashboard"})
