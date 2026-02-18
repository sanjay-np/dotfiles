return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		--- blink.cmp capabilities for all LSP servers
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		--- diagnostics
		vim.diagnostic.config({
			virtual_lines = false,
			virtual_text = true,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
				focusable = true,
				style = "minimal",
				header = "",
				prefix = "",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "mp", "Snacks" },
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.enable({
			"lua_ls",
			"tailwindcss",
			"ts_ls",
			"cssls",
			"intelephense",
			"emmet_ls",
			"phpactor",
			"typos_lsp",
		})

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf, silent = true }

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Goto Definition"
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Goto Definition in Vertical Split"
				keymap.set("n", "gvd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			end,
		})
	end,
}
