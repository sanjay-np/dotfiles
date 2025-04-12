return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				--lua
				null_ls.builtins.formatting.stylua,
				--php
				null_ls.builtins.diagnostics.phpstan,
				null_ls.builtins.formatting.phpcsfixer,

				--javascript
				null_ls.builtins.formatting.prettierd,
				require("none-ls.diagnostics.eslint_d"),
			},
		})
		vim.diagnostic.config({ virtual_text = true })
	end,
}
