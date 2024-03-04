return {
  'nvim-treesitter/nvim-treesitter',
  name = 'Treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-context', name = 'Treesitter-Context', opts = true },
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'rust',
        'c',
        'go',
        'java',
        'c_sharp',
        'typescript',
        'javascript',
        'bash',
        'fish',
        'json',
        'jsonc',
        'toml',
        'vim',
        'vimdoc',
      },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
