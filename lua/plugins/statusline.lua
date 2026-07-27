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
                },
                lualine_x = {
                    {
                        -- Sidekick CLI session status
                        function()
                            local status = require("sidekick.status").cli()
                            local icon = require("sidekick.config").ui.icons.terminal_attached
                            return icon .. (#status > 1 and (" " .. #status) or "")
                        end,
                        cond = function() return #require("sidekick.status").cli() > 0 end,
                    },
                    {
                        -- Sidekick Copilot NES status
                        function() return require("sidekick.config").ui.icons.nes end,
                        color = function()
                            local status = require("sidekick.status").get()
                            if status then
                                return status.kind == "Error" and "DiagnosticError"
                                    or status.busy and "DiagnosticWarn"
                                    or nil
                            end
                        end,
                        cond = function() return require("sidekick.status").get() ~= nil end,
                    },
                },
                lualine_z = {
                    "location",
                },
            },
        }
    end
}
