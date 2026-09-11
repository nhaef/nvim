return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        -- For filetypes not listed below, fall back to LSP formatting.
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            javascript      = { "prettier",  lsp_format = "fallback" },
            javascriptreact = { "prettier",  lsp_format = "fallback" },
            typescript      = { "prettier",  lsp_format = "fallback" },
            typescriptreact = { "prettier",  lsp_format = "fallback" },
            json            = { "prettier",  lsp_format = "fallback" },
            jsonc           = { "prettier",  lsp_format = "fallback" },
            yaml            = { "prettier",  lsp_format = "fallback" },
            rust            = { "rustfmt",   lsp_format = "fallback" },
        },
    },
}
