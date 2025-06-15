return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        delay = 0,
        spec = {
            { "<leader>f", group = "[F]ind files" },
            { "<leader>t", group = "[T]abs Options" },
            { "<leader>b", group = "[B]uffers Options",       mode = "n" },
            { "<leader>s", group = "[S]creen Options",        mode = "n" },
            { "<leader>h", group = "Git [H]unk",              mode = { "n", "v" } },
            { "<leader>x", group = "Diagnostics [X] Options", mode = "n" },
        },
    },
}
