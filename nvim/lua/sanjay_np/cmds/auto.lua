-- highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Vertical Column in files with indenting
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.yml", "*.yaml", "*.py" },
	desc = "Activating Vertical Highlight in files that require indenting",
	group = vim.api.nvim_create_augroup("Vertical-highlight", { clear = true }),
	callback = function()
		vim.opt.cursorcolumn = true
		vim.api.nvim_set_hl(0, "hl-CursorColumn", { bg = "#222222" })
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})

-- These are the auto commands that run after
-- the lspattaches and provide some good shortcuts and keymaps
-- for making the editing experience great again

local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- set keybinds
		--
		-- show definition, references
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		-- go to declaration
		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		-- show lsp definitions
		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		-- Open LSP definition in vertical split
		vim.keymap.set("n", "gvd", function()
			vim.cmd("vsplit")
			vim.cmd("wincmd l")
			vim.lsp.buf.definition()
		end, { noremap = true, silent = true })

		-- show lsp implementations
		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		--show lsp type definitions
		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		-- see available code actions, in visual mode will apply to selection
		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		-- smart rename
		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		--show lsp diagnostics for file
		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		-- show diagnostics for line
		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		-- jump to previous diagnostic in buffer
		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

		-- jump to next diagnostic in buffer
		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		-- show documentation for what is under cursor
		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- mapping to restart lsp if necessary
		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})
