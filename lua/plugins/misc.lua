return {
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
        keys = {
            {
                "<leader>-",
                function() Snacks.explorer() end,
                desc = "Open file explorer at current file",
            },
            {
                "<leader>cw",
                function() Snacks.explorer({ cwd = vim.fn.getcwd() }) end,
                desc = "Open file explorer in current working directory",
            },
            {
                "<leader>tt",
                function() Snacks.terminal.toggle() end,
                desc = "Toggle terminal",
            },
        },
        opts = {
            input = {
                enabled = true, -- Enhances `ask()`
            },
            explorer = {
                enabled = true,
            },
            terminal = {
                enabled = true,
            },
            picker = {
                enabled = true, -- Enhances `select()`
                ui_select = true,
                sources = {
                    files = { exclude = { "node_modules", "target" } },
                    grep  = { exclude = { "node_modules", "target" } },
                },
                actions = {
                    sidekick_send = function(...)
                        return require("sidekick.cli.picker.snacks").send(...)
                    end,
                },
                win = {
                    input = {
                        keys = {
                            ["<a-a>"] = {
                                "sidekick_send",
                                mode = { "n", "i" },
                            },
                            ["<a-h>"] = false, -- unblock smart-splits resize_left
                        },
                    },
                    list = {
                        keys = {
                            ["<a-h>"] = false, -- unblock smart-splits resize_left
                        },
                    },
                },
            },
        },
    },
}
