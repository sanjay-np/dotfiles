return {
	{
		"sanjay-np/dbab.nvim",
		branch = "blink-cmp",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("dbab").setup({
				connections = {
					{ name = "b_school", url = "mysql://root@127.0.0.1:3306/b_school" },
				},
			})
		end,
	},
}
