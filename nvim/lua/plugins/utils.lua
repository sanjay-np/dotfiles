return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
			require("Comment").setup({
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			win = {
				border = "rounded",
				padding = { 1, 2 },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"chrisgrieser/nvim-early-retirement",
		event = "VeryLazy",
		config = function()
			require("early-retirement").setup({
				-- If a buffer has been inactive for this many minutes, close it.
				retirementAgeMins = 5,

				-- Minimum number of open buffers for auto-closing to become active. E.g.,
				-- by setting this to 4, no auto-closing will take place when you have 3
				-- or fewer open buffers. Note that this plugin never closes the currently
				-- active buffer, so a number < 2 will effectively disable this setting.
				minimumBufferNum = 1,
			})
		end,
	},
}
