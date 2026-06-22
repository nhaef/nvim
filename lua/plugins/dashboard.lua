local logo = {
    "",
    "",
    "           ▄▄                                                             ",
    "           ██                               ███                         ",
    " ▄▄        ██                               ██                            ",
    " ████████ ████████  ██████ ███████    ██                            ",
    " ██   ██ ██   ██       ██ █       █ ████████                         ",
    " ██     ██ ██     ██  ███████ ████████    ██       █ █ █  █ █  █ ",
    " ██     ██ ██     ██     ██ █            ██       ██ █  █ ██ ",
    " ██     ██ ██     ██ ███████ ██████     ██       █ █ █   █ █  █ ",
    "",
    "",
    "",
}

return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function()
            require("dashboard").setup {
                theme = 'doom',
                -- preview = {
                --     command = "lolcrab -s 0.0125",
                --     file_path = vim.fn.stdpath("config") .. "/static/logo.txt",
                --     file_width = 74,
                --     file_height = 13,
                -- },
                config = {
                    vertical_center = true,
                    header = logo,
                    center = {
                        {
                            icon = "󰱼 ",
                            desc = "find file",
                            key = "f",
                            action = "lua Snacks.picker.files()",
                        },
                        {
                            icon = "󱎸 ",
                            desc = "find text",
                            key = "g",
                            action = "lua Snacks.picker.grep()",
                        },
                        {
                            icon = " ",
                            desc = "new file",
                            key = "n",
                            action = "enew",
                        },
                        {
                            icon = " ",
                            desc = "config",
                            key = "c",
                            action = "lua vim.cmd('cd ' .. vim.fn.stdpath('config') .. ' | e init.lua')",
                        },
                        {
                            icon = " ",
                            desc = "manage plugins",
                            key = "p",
                            action = "Lazy",
                        },
                        {
                            icon = "󰦛 ",
                            desc = "restore session",
                            key = "r",
                            action = "lua require('persistence').load()",
                        },
                    },
                    footer = {
                        "",
                        "https://github.com/nhaef/nvim.git",
                        "",
                    },
                }
            }
        end
    }
}
