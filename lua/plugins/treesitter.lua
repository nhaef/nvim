return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Register custom CDS parser
            vim.api.nvim_create_autocmd("User", {
                pattern = "TSUpdate",
                callback = function()
                    require("nvim-treesitter.parsers").cds = {
                        install_info = {
                            url = "https://github.com/cap-js-community/tree-sitter-cds",
                            branch = "main",
                        },
                    }
                end,
            })

            -- Install non-bundled parsers (bundled in 0.12: c, lua, markdown, vim, vimdoc, query)
            require("nvim-treesitter").install { "rust", "kdl", "typst", "cds" }

            -- Enable treesitter highlighting for filetypes without built-in ftplugin support
            -- (Neovim 0.12 only auto-enables for: lua, markdown, help, query)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "rust", "kdl", "typst", "cds", "c", "vim" },
                callback = function() vim.treesitter.start() end,
            })
        end,
    },
}
