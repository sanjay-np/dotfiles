return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
				dim_inactive = true,
				on_colors = function(colors)
					colors.border = "#565f89"
				end,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
