return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable({
                "lua_ls",
                "basedpyright",
                "ts_ls",
                "clangd",
                "hls",
                "cds_lsp",
                "tinymist",
                "copilot",
            })
        end,
    },
}
