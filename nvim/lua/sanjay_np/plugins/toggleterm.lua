return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
	},
	config = true,
	opts = {
		size = 80,
		direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
	},
}
