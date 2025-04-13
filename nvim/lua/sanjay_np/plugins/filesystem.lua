return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                buffers = {
                    previewer = false,
                    theme = "dropdown",
                    mappings = {
                        n = {
                            ["<C-e>"] = "delete_buffer",
                            ["l"] = "select_default",
                        },
                    },
                    initial_mode = "normal",
                },
                pickers = {
                    find_files = {
                        path_display = { "smart" },
                        layout_config = {
                            prompt_position = "top",
                        },
                        sorting_strategy = "ascending",
                    },
                    git_files = {
                        path_display = { "smart" },
                        layout_config = {
                            prompt_position = "top",
                        },
                        sorting_strategy = "ascending",
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    file_browser = {
                        theme = "ivy",
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
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
                delete_to_trash = true,
                skip_confirm_for_simple_edits = true,
                prompt_save_on_select_new_entry = false,
            })
        end,
    },
}
