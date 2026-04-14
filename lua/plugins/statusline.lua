return {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = "auto",
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
