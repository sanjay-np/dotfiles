return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
			},
			view_options = {
				show_hidden = true, -- show hidden files by default
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-t>"] = false,
				["<C-r>"] = "actions.refresh",
				["<C-p>"] = function()
					local oil = require("oil")
					local util = require("oil.util")

					local is_preview_open = util.get_preview_win()

					if is_preview_open then
						vim.api.nvim_win_close(is_preview_open, true)
					else
						oil.open_preview({
							split = "belowright",
						})
					end
				end,
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
