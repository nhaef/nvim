return {
    {
        "nickjvandyke/opencode.nvim",
        version = "*",
        config = function()
            local opencode_cmd = "opencode --port"
            ---@type snacks.terminal.Opts
            local snacks_terminal_opts = {
                win = {
                    position = "right",
                    enter = false,
                },
            }

            ---@type opencode.Opts
            vim.g.opencode_opts = {
                server = {
                    start = function()
                        require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
                    end,
                },
            }

            -- Required for `opts.events.reload`.
            vim.o.autoread = true

            -- Toggle the OpenCode terminal (n + t modes; avoid <leader> here to prevent input delay in terminal)
            vim.keymap.set({ "n", "t" }, "<C-.>", function()
                require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
            end, { desc = "Toggle OpenCode" })

            -- Show the terminal automatically when a prompt is submitted
            vim.api.nvim_create_autocmd("User", {
                pattern = "OpencodeEvent:tui.command.execute",
                callback = function(args)
                    ---@type opencode.server.Event
                    local event = args.data.event
                    if event.properties.command == "prompt.submit" then
                        local win = require("snacks.terminal").get(opencode_cmd, { create = false })
                        if win then win:show() end
                    end
                end,
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "hrsh7th/nvim-cmp",
        init = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' }, -- For vsnip users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    { name = 'cmdline' },
                })
            })
        end
    },
    {
        "hrsh7th/cmp-vsnip",
    },
    {
        "hrsh7th/vim-vsnip",
    },

}
