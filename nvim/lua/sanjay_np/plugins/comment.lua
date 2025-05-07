return {
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function()
			local ft = require("Comment.ft")
			ft.set("javascriptreact", { "{/*%s*/}", "{/*%s*/}" })
			ft.set("typescriptreact", { "{/*%s*/}", "{/*%s*/}" })
		end,
	},
}
