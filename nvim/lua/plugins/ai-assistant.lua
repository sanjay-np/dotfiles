return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				-- The default value is "supermaven"
				color = {
					cterm = 244,
				},
				log_level = "off",
			})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "openrouter",
					},
					inline = {
						adapter = "openrouter",
					},
				},
				adapters = {
					openrouter = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://openrouter.ai/api",
								api_key = "",
								chat_url = "/v1/chat/completions",
							},
							schema = {
								model = {
									default = "qwen/qwen3-coder:free",
								},
							},
						})
					end,
				},
			})
		end,
	},
}
