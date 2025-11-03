vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

local group_lsp = vim.api.nvim_create_augroup("RustUserLspConfig", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = group_lsp,
    callback = function()
        -- rust runnables
        vim.keymap.set("n", "<space>rr", function()
            vim.cmd.RustLsp("runnables")
        end, {
            desc = "rust runnables"
        })

        -- rust debuggables
        vim.keymap.set("n", "<space>rd", function()
            vim.cmd.RustLsp("debuggables")
        end, {
            desc = "rust debuggables"
        })

        -- rust macro expand
        vim.keymap.set("n", "<space>rme", function()
            vim.cmd.RustLsp("expandMacro")
        end, {
            desc = "rust macro expand"
        })

        -- rust parent module
        vim.keymap.set("n", "<space>rp", function()
            vim.cmd.RustLsp("parentModule")
        end, {
            desc = "rust parent module"
        })

        -- rust docs
        vim.keymap.set("n", "<space>rod", function()
            vim.cmd.RustLsp("openDocs")
        end, {
            desc = "rust docs"
        })

        -- rust explain error
        vim.keymap.set("n", "<space>ree", function()
            vim.cmd.RustLsp("explainError")
        end, {
            desc = "rust explain error"
        })

        -- rust explain diagnostics
        vim.keymap.set("n", "<space>red", function()
            vim.cmd.RustLsp("renderDiagnostic")
        end, {
            desc = "rust explain diagnostics"
        })
    end
})
