return {
    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_transparent_background = 1
            vim.g.sonokai_disable_italic_comment = 1
            vim.g.sonokai_enable_italic = false
            vim.cmd.colorscheme('sonokai')
        end
    },
}
