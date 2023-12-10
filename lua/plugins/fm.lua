return {
  'is0n/fm-nvim',
  config = function()
    vim.keymap.set('n', '<leader>xp', '<cmd>Xplr<cr>', { noremap = true, silent = true, desc = 'Open Xplr' })
    vim.keymap.set('n', '<leader>fz', '<cmd>Fzf<cr>', { noremap = true, silent = true, desc = 'Open Fzf' })
    require('fm-nvim').setup({
      ui = {
        float = {
          border = 'single',
          height = 0.9,
          width = 0.9,
        },
      },
    })
  end,
}
