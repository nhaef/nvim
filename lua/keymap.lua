-- find file
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {
    desc = "find file"
})

-- find all
vim.keymap.set("n", "<leader>fa", function()
    require("telescope.builtin").find_files({ hidden = true })
end, {
    desc = "find all"
})

-- fing grep
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {
    desc = "find grep"
})

-- find buffer
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {
    desc = "find buffer"
})

-- find help
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {
    desc = "find help"
})

-- open dashboard
vim.keymap.set("n", "<leader>dd", function() vim.cmd("Dashboard") end, {
    desc = "open dashboard"
})

-- toggle relative line numbers
vim.keymap.set("n", "<leader>ll", require("config.statuscolumn").toggle, {
    desc = "toggle relative line numbers"
})

-- next diagnostic
vim.keymap.set("n", "[j", vim.diagnostic.goto_next, {
    desc = "go to next diagnostic"
})

-- previous diagnostic
vim.keymap.set("n", "[k", vim.diagnostic.goto_prev, {
    desc = "go to previous diagnostic"
})


-- lsp keymap
local group_lsp = vim.api.nvim_create_augroup('UserLspConfig', {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = group_lsp,
    callback = function()
        -- lazy git
        vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", {
            silent = true,
            desc = "lazy git"
        })

        -- hover
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            desc = "hover"
        })

        -- signature help (changed from <C-k> to avoid conflict with smart-splits)
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, {
            desc = "signature help"
        })

        -- rename
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {
            desc = "rename"
        })

        -- code actions
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {
            desc = "code actions"
        })

        -- go declaration
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            desc = "go declaration"
        })

        -- go definition
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            desc = "go definition"
        })

        -- go implementation
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
            desc = "go implementation"
        })

        -- go references
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {
            desc = "go references"
        })

        -- type definitions
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {
            desc = "type definitions"
        })

        -- lsp format
        vim.keymap.set("n", "<space>lf", function()
            vim.lsp.buf.format {
                async = true,
                formatting_options = {
                    tabSize = 4,
                    trimTrailingWhitespace = true,
                    insertFinalNewline = true,
                }
            }
        end, {
            desc = "lsp format"
        })

        -- lsp inlay hint toggle
        vim.keymap.set("n", "<space>li", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, {
            desc = "lsp inlay hint toggle"
        })

        -- lsp diagnostic toggle
        vim.keymap.set("n", "<space>ld", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
            require("lualine").refresh()
        end, {
            desc = "lsp diagnostic toggle"
        })


        -- nvim-dap keymap --
        vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
        vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
        vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
        vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
        vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
        vim.keymap.set('n', '<Leader>lp',
            function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
        vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
            require('dap.ui.widgets').hover()
        end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
            require('dap.ui.widgets').preview()
        end)
        vim.keymap.set('n', '<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end)
        vim.keymap.set('n', '<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end)
    end,
})
