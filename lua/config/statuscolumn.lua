vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %{%v:virtnum<1?(v:relnum?'%='.(g:toggle_relnum?v:relnum:v:lnum):'%#Bold#'.v:lnum.'%='):''%} "
vim.g.toggle_relnum = true

return {
    toggle = function()
        vim.g.toggle_relnum = not vim.g.toggle_relnum
        vim.api.nvim__redraw({
            statuscolumn = true
        })
    end
}
