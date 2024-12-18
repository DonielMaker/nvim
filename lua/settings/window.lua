-------------------------------------------------------------------------------
------------------------------ Window Configuration ---------------------------
-------------------------------------------------------------------------------

local keymap = vim.keymap.set

-- keymap("n")

keymap("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

keymap("n", "<leader>tv", "<C-w>v", { desc = "Split window vertically"})
keymap("n", "<leader>th", "<C-w>s", { desc = "Split window horizontally"})
keymap("n", "<leader>tx", "<C-w>q", { desc = "Close current window"})

keymap("n", "<C-Up>", "<C-w>k", { desc = "Navigate Up"})
keymap("n", "<C-Down>", "<C-w>j", { desc = "Navigate Down"})
keymap("n", "<C-Left>", "<C-w>h", { desc = "Navigate Left"})
keymap("n", "<C-Right>", "<C-w>l", { desc = "Navigate Right"})

keymap("n", "<S-Up>", "<C-w>+", { desc = "Increase window height"})
keymap("n", "<S-Down>", "<C-w>-", { desc = "Decrease window height"})
keymap("n", "<S-Left>", "<C-w>>", { desc = "Increase window width"})
keymap("n", "<S-Right>", "<C-w><", { desc = "Decrease window width"})

keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal"})
