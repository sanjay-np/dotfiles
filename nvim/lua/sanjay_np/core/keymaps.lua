local builtin = require("telescope.builtin")
local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- Map jj to esc
map("i", "jj", "<esc>l", defaults)

-- Telescope
map("n", "ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>ff", builtin.git_files, { desc = "Telescope find Git files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover Information" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition in a vertical split" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

--Format buffer
map("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
