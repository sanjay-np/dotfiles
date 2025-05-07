return {
	{
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.edge_disable_italic_comment = true
			vim.g.edge_enable_italic = false
			vim.g.edge_style = "neon"
			vim.g.edge_transparent_background = true
			vim.g.edge_dim_foreground = true
			vim.cmd.colorscheme("edge")
		end,
	},
}
