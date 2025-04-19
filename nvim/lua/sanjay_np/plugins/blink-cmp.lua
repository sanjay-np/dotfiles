return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			signature = {
				enabled = true,
			},
			sources = {
				-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Use a preset for snippets, check the snippets documentation for more information
			snippets = { preset = "luasnip" },

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
		opts_extend = { "sources.default" },
	},
}
