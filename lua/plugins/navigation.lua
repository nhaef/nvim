return {
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {
                        "node%_modules/.*",
                        "target/.*",
                    }
                }
            }
        end,
    },
    {
        'mrjones2014/smart-splits.nvim',
        lazy = false,
        config = function()
            local smart_splits = require('smart-splits')

            -- resizing splits
            vim.keymap.set('n', '<A-h>', smart_splits.resize_left)
            vim.keymap.set('n', '<A-j>', smart_splits.resize_down)
            vim.keymap.set('n', '<A-k>', smart_splits.resize_up)
            vim.keymap.set('n', '<A-l>', smart_splits.resize_right)

            -- moving between splits
            vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left)
            vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down)
            vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up)
            vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right)
            vim.keymap.set('n', '<C-\\>', smart_splits.move_cursor_previous)

            -- swapping buffers between windows
            vim.keymap.set('n', '<leader><leader>h', smart_splits.swap_buf_left)
            vim.keymap.set('n', '<leader><leader>j', smart_splits.swap_buf_down)
            vim.keymap.set('n', '<leader><leader>k', smart_splits.swap_buf_up)
            vim.keymap.set('n', '<leader><leader>l', smart_splits.swap_buf_right)
        end,
    }
}
