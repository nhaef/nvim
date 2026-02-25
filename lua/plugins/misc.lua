return {
    {
        "https://codeberg.org/esensar/nvim-dev-container",
        init = function()
            require("devcontainer").setup {}
        end
    },
    {
        "mistricky/codesnap.nvim",
        tag = "v1.6.3",
        event = "BufEnter",
        build = "make",
        opts = {
            has_line_number = true,
            bg_padding = 0,
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            input = {},
            picker = {},
            actions = {
                opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
        },
    },
}
