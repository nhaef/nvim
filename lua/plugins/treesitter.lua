return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        init = function()

            -- custom parser for cds
            local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
            parser_config.cds = {
                install_info = {
                    url = 'https://github.com/cap-js-community/tree-sitter-cds.git',
                    files = { 'src/parser.c', 'src/scanner.c' },
                    branch = 'main',
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false
                },
                filetype = 'cds',
                used_by = { 'cdl', 'hdbcds' }
            }

            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "cds", "lua", "vim", "vimdoc", "query", "rust", "kdl", "jsonc", "typst" },
                sync_install = false,
                auto_install = false,
                highlight = {
                    enable = true,
                },
            }
        end
    },
}
