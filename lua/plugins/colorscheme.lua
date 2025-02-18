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
                }
            });
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    }
}
