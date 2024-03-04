return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = 'moon',
      transparent = true,
      styles = {
        keywords = { italic = false },
        floats = 'transparent',
        sidebars = 'transparent',
      },
      -- on_colors = function (colors)
      --   colors.bg_float = 'none'
      --   colors.bg_sidebar = 'none'
      -- end
    })

    vim.cmd[[colorscheme tokyonight]]
  end,
}
