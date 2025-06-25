return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_markers = { "tsconfig.json", ".git", "jsconfig.json" },
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
}
