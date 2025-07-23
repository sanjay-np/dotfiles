return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					floats = "transparent",
				},
				on_colors = function(colors)
					colors.border = "#565f89"
				end,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
