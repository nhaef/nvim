return {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
                },
                lualine_c = {
                    "filename",
                    {
                        "lsp_status",
                        icon = "󱁤",
                        ignore_lsp = { "GitHub Copilot" },
                    },
                    {
                        "diagnostics",
                        cond = vim.diagnostic.is_enabled
                    },
                    {
                        require("opencode").statusline,
                    },
                },
            },
        }
    end
}
