return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                color_overrides = {
                    mocha = {
                        base = "#000000",
                        mantle = "#101010",
                        crust = "#202020",
                    },
                    latte = {
                        base = "#FFFFFF",
                        mantle = "#F0F0F0",
                        crust = "#E0E0E0",
                    },
                }
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            update_interval = 1000,
            fallback = "dark",
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
            end,
        },
    },
}
