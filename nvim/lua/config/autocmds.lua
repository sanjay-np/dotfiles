-- highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local keymap = vim.keymap -- for conciseness

---LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", {
		clear = true,
	}),
	callback = function(event)
		-- Buffer local mappings.
		local opts = { buffer = event.buf, silent = true }

		-- show documentation for what is under cursor
		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- go to declaration
		opts.desc = "Goto Definition in Vertical Split"
		keymap.set("n", "gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", opts)

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
	end,
})
