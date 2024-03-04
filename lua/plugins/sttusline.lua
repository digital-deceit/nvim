return {
  'sontungexpt/sttusline',
  name = 'Sttusline',
  branch = 'table_version',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = { 'BufEnter' },
  config = function(_, opts)
    require('sttusline').setup()
  end,
}
