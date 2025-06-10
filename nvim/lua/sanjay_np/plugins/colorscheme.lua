return {
    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_transparent_background = 1
            vim.g.sonokai_disable_italic_comment = 0
            vim.g.sonokai_enable_italic = false
            vim.g.sonokai_style = "atlantis"
            -- vim.cmd.colorscheme('sonokai')
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "moon",
                transparent = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd.colorscheme('tokyonight')
        end
    }
}
