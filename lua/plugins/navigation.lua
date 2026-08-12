return {
    {
        'mrjones2014/smart-splits.nvim',
        lazy = false,
        config = function()
            local smart_splits = require('smart-splits')

            -- resizing splits (also works from terminal mode, e.g. sidekick's CLI terminal)
            vim.keymap.set({ 'n', 't' }, '<A-h>', smart_splits.resize_left)
            vim.keymap.set({ 'n', 't' }, '<A-j>', smart_splits.resize_down)
            vim.keymap.set({ 'n', 't' }, '<A-k>', smart_splits.resize_up)
            vim.keymap.set({ 'n', 't' }, '<A-l>', smart_splits.resize_right)

            -- moving between splits
            vim.keymap.set({ 'n', 't' }, '<C-h>', smart_splits.move_cursor_left)
            vim.keymap.set({ 'n', 't' }, '<C-j>', smart_splits.move_cursor_down)
            vim.keymap.set({ 'n', 't' }, '<C-k>', smart_splits.move_cursor_up)
            vim.keymap.set({ 'n', 't' }, '<C-l>', smart_splits.move_cursor_right)
            vim.keymap.set({ 'n', 't' }, '<C-\\>', smart_splits.move_cursor_previous)

            -- swapping buffers between windows
            vim.keymap.set('n', '<leader><leader>h', smart_splits.swap_buf_left)
            vim.keymap.set('n', '<leader><leader>j', smart_splits.swap_buf_down)
            vim.keymap.set('n', '<leader><leader>k', smart_splits.swap_buf_up)
            vim.keymap.set('n', '<leader><leader>l', smart_splits.swap_buf_right)
        end,
    },

}
