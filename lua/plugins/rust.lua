vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ['rust-analyzer'] = {
                -- cargo = {
                --     features = "all"
                -- }
            }
        }
    }
}

return {
    {
        "mrcjkb/rustaceanvim",
        name = "rustaceanvim",
        version = '^7',
        lazy = false,
    }
}
