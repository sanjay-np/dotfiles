return {
	"akinsho/bufferline.nvim",
	enabled = true,
	event = "VeryLazy",
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				tab_size = 20,
				separator_style = "thin",
				groups = {
					options = {
						toggle_hidden_on_enter = true,
					},
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = "" }),
					},
				},
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
	end,
}
