return {
    {
        "https://codeberg.org/esensar/nvim-dev-container",
        init = function()
            require("devcontainer").setup {}
        end
    },
    {
        "mistricky/codesnap.nvim",
        version = "^2",
        event = "BufEnter",
        opts = {
            show_line_number = true,
            snapshot_config = {
                window = {
                    margin = { x = 0, y = 0 },
                },
            },
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
