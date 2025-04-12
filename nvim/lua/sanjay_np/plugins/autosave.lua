return {
    {
        "brianhuster/autosave.nvim",
        event = "InsertEnter",
        config = function()
            require("autosave").setup({})
        end,
    },
}
