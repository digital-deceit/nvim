return {
  'nvimtools/none-ls.nvim',
  name = 'None-ls',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    border = 'rounded',
  },
  config = function()
    local null = require('null-ls')
    null.setup({
      sources = {
        null.builtins.diagnostics.luacheck.with({
          extra_args = { '--globals', 'vim' },
        }),
      },
    })
  end,
}
