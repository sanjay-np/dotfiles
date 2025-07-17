return {
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
				italic = false,
				bold = false,
			})
			vim.cmd.colorscheme("vague")
		end,
	},
}
