return {
  'brenoprata10/nvim-highlight-colors',
  name = 'Highlight-Colors',
  keys = {
    { '<leader>hc', '<cmd>HighlightColorsOn<cr>', desc = 'Toggle highlight colors' },
  },
  config = function()
    require('nvim-highlight-colors').setup{
      render = 'background',
      enable_named_colors = true,
      enable_tailwind = true,
    }
  end
}
