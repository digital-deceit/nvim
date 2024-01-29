return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').set_icon({
      astro = {
        icon = '',
        color = '#FF7600',
        cterm_color = '208',
        name = 'Astro'
      }
    })
    require('nvim-web-devicons').setup({})
  end,
}
