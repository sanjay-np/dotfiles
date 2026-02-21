local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Tab Options
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Buffer Width
keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<CR>", { desc = "Increase buffer width" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<CR>", { desc = "Decrease buffer width" })

-- Buffer Height
keymap.set("n", "<C-Down>", "<cmd>resize +5<CR>", { desc = "Increase buffer height" })
keymap.set("n", "<C-Up>", "<cmd>resize -5<CR>", { desc = "Decrease buffer height" })
