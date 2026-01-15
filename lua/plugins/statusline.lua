return {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/lsp-status.nvim" },
    init = function()
        local custom_16color = require("lualine.themes.16color")
        local colors = {
            dark_gray = "#282828",
        }
        custom_16color.normal.b.bg = colors.dark_gray
        custom_16color.inactive.b.bg = colors.dark_gray
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = custom_16color,
                component_separators = {
                    left = "|",
                    right = "|",
                },
                section_separators = {
                    left = "",
                    right = "",
                }
            },
            sections = {
                lualine_b = {
                    "branch",
                    "diff",
                    {
                        "diagnostics",
                        cond = vim.diagnostic.is_enabled
                    },
                },
                lualine_c = {
                    "filename",
                    function()
                        return require("lsp-status").status()
                    end,
                },
            },
        }
    end
}
