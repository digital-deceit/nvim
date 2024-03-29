return {
  'Exafunction/codeium.nvim',
  name = 'Codeium',
  dependencies = {
    'nvim-lua/plenary.nvim',
    name = 'Plenary'
  },
  config = function()
    vim.keymap.set('i', '<c-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true })
    vim.keymap.set('i', '<c-}>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true })
    vim.keymap.set('i', '<c-{>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true })
    vim.keymap.set('i', '<c-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true })

    require('codeium').setup({})
  end,
}
