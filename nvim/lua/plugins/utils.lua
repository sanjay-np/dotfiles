return {
	{
		"numToStr/Comment.nvim",
		config = function()
			local ft = require("Comment.ft")
			ft.set("javascriptreact", { "{/*%s*/}", "{/*%s*/}" })
			ft.set("typescriptreact", { "{/*%s*/}", "{/*%s*/}" })
			require("Comment").setup({
				--
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				delay = 200,
				large_file_cutoff = 2000,
				large_file_overrides = {
					providers = { "lsp" },
				},
			})
		end,
	},
}
