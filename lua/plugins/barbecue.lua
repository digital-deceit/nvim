return {
  'utilyre/barbecue.nvim',
  name = 'Barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
  },
  opts = {
    vim.api.nvim_create_autocmd({
      'WinScrolled',
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',

      -- include this if you have set `show_modified` to `true`
      -- "BufModifiedSet",
    }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    }),
    -- configurations go here
    create_autocmd = false,
    attach_navic = false,
  },
}
