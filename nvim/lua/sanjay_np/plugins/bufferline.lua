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
			},
		})
	end,
}
