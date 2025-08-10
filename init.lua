require('options')
require('plugins')
require('colorscheme')
require('keymaps')
require('lsp')
vim.cmd [[
    highlight CursorLine guibg=#2e262d
]]
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#69616a', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#69616a', bold=true })
vim.g.python3_host_prog = vim.fn.getcwd() .. '/.venv/bin/python'
vim.opt.termguicolors = true
require("bufferline").setup{}
vim.diagnostic.handlers.virtual_text = {
  show = function(namespace, bufnr, diagnostics, opts)
    local filtered = vim.tbl_filter(function(d)
      return not d.message:match("too many blank lines")
    end, diagnostics)
    vim.diagnostic.handlers.virtual_text.show(namespace, bufnr, filtered, opts)
  end
}
