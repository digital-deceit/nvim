return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')

    vim.keymap.set('n', '<leader>ff', '<cmd>Format<cr>', { desc = '[F]ormat [F]ile' })

    local sources = {
      -- [[ Formatters ]]
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.beautysh,
    }

    null_ls.setup({
      sources = sources,
    })
  end,
}
