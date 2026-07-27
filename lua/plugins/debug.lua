return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            {
                "microsoft/vscode-js-debug",
                version = "1.x",
                run = "npm ci && npm run compile dapDebugServer && mv dist out",
            },
        },
        keys = {
            { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
            { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
            { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
            { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
            { "<Leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
            { "<Leader>B", function() require("dap").set_breakpoint() end, desc = "Debug: Set Breakpoint" },
            {
                "<Leader>lp",
                function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
                desc = "Debug: Set Log Point",
            },
            { "<Leader>dr", function() require("dap").repl.open() end, desc = "Debug: Open REPL" },
            { "<Leader>dl", function() require("dap").run_last() end, desc = "Debug: Run Last" },
            {
                "<Leader>dh",
                function() require("dap.ui.widgets").hover() end,
                mode = { "n", "v" },
                desc = "Debug: Hover",
            },
            {
                "<Leader>dp",
                function() require("dap.ui.widgets").preview() end,
                mode = { "n", "v" },
                desc = "Debug: Preview",
            },
            {
                "<Leader>df",
                function()
                    local widgets = require("dap.ui.widgets")
                    widgets.centered_float(widgets.frames)
                end,
                desc = "Debug: Frames",
            },
            {
                "<Leader>ds",
                function()
                    local widgets = require("dap.ui.widgets")
                    widgets.centered_float(widgets.scopes)
                end,
                desc = "Debug: Scopes",
            },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            local debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/dapDebugServer.js"
            dap.adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = { debugger_path, "${port}" },
                },
            }
            dap.configurations.javascript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
            }
            dap.configurations.typescript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
            }
        end,
    },
}
