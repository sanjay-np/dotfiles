return {
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			require("tree-sitter-manager").setup({
				-- Default Options
				ensure_installed = {
					"lua",
					"bash",
					"markdown",
					"html",
					"css",
					"php_only",
					"php",
					"blade",
					"javascript",
					"typescript",
					"tsx",
					"json",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 5,
				trim_scope = "outer",
				mode = "cursor",
				separator = nil,
				zindex = 220,
			})
			-- Make context background transparent
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "NONE" }) -- optional
			vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = false })
		end,
	},
}
