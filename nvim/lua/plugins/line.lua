return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status")
		local colors = {
			blue = "#7aa2f7",
			cyan = "#7dcfff",
			fg = "#c0caf5",
			orange = "#ff9e64",
		}

		local theme_section = {
			a = { fg = colors.blue, bg = "none" },
			b = { fg = colors.cyan, bg = "none" },
			c = { fg = colors.fg, bg = "none" },
		}

		local line_colors = {
			normal = theme_section,
			insert = theme_section,
			visual = theme_section,
			replace = theme_section,
			command = theme_section,
			inactive = theme_section,
		}

		require("lualine").setup({
			options = {
				theme = line_colors,
				icons_enabled = true,
				globalstatus = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "[No Name]" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						-- fmt = function(str)
						-- 	return str:sub(1, 3)
						-- end,
					},
				},
				lualine_b = { "branch", "lsp_status" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "󰷈",
							readonly = "󰌾",
						},
					},
					{ "filesize" },
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "filetype" },
					{ "searchcount" },
				},
				lualine_y = {
					{ "progress" },
				},
			},
		})

		-- Force StatusLine highlight groups to be transparent
		vim.cmd([[
			highlight StatusLine guibg=none ctermbg=none
			highlight StatusLineNC guibg=none ctermbg=none
		]])
	end,
}
