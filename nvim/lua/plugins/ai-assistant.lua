return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				-- The default value is "supermaven"
				color = {
					suggestion_color = "#8c98b3",
					cterm = 244,
				},
				log_level = "off",
			})
		end,
	},
}
