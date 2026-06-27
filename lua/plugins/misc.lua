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
            input = {
                enabled = true, -- Enhances `ask()`
            },
            picker = {
                enabled = true, -- Enhances `select()`
                ui_select = true,
                sources = {
                    files = { exclude = { "node_modules", "target" } },
                    grep  = { exclude = { "node_modules", "target" } },
                },
                actions = {
                    opencode_send = function(picker) ---@param picker snacks.Picker
                        local items = vim.tbl_map(function(item) ---@param item snacks.picker.Item
                            return item.file
                                and require("opencode").format({ path = item.file, from = item.pos, to = item.end_pos })
                                or item.text
                        end, picker:selected({ fallback = true }))
                        require("opencode").prompt(table.concat(items, ", ") .. " ")
                    end,
                },
                win = {
                    input = {
                        keys = {
                            ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                        },
                    },
                },
            },
        },
    },
}
