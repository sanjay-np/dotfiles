vim.lsp.enable({
	"lua-ls",
	"ts-ls",
	"tailwind-ls",
	"css-lsp",
	"intelephense",
})

--- diagnostics
vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		focusable = true,
		style = "minimal",
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
})
