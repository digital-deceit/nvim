return {
  'lukas-reineke/indent-blankline.nvim',
  name = 'Indent-Blank-Line',
  main = 'ibl',
  opts = {},
  config = function()
    require('ibl').setup()
  end,
}
