return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()

            local harpoon = require("harpoon")

            harpoon:setup()

            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "<C-a>", function() harpoon:list():add() end)
            keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            keymap.set("n", "<C-f1>", function() harpoon:list():select(1) end, { desc = "1st harpoon item"})
            keymap.set("n", "<C-f2>", function() harpoon:list():select(2) end, { desc = "2nd harpoon item"})
            keymap.set("n", "<C-f3>", function() harpoon:list():select(3) end, { desc = "3rd harpoon item"})
            keymap.set("n", "<C-f4>", function() harpoon:list():select(4) end, { desc = "4th harpoon item"})
            keymap.set("n", "<C-f5>", function() harpoon:list():select(5) end, { desc = "5th harpoon item"})
            keymap.set("n", "<C-f6>", function() harpoon:list():select(6) end, { desc = "6th harpoon item"})
            keymap.set("n", "<C-f7>", function() harpoon:list():select(7) end, { desc = "7th harpoon item"})
            keymap.set("n", "<C-f8>", function() harpoon:list():select(8) end, { desc = "8th harpoon item"})
            keymap.set("n", "<C-f9>", function() harpoon:list():select(9) end, { desc = "9th harpoon item"})
            keymap.set("n", "<C-f0>", function() harpoon:list():select(10) end, { desc = "10th harpoon item"})
        end
    }
}

