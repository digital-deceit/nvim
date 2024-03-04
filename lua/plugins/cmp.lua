return {
  'hrsh7th/nvim-cmp',
  name = 'Cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      name = 'LuaSnip',
      build = (function()
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    { 'saadparwaiz1/cmp_luasnip', name = 'Cmp-LuaSnip' },

    { 'hrsh7th/cmp-nvim-lsp', name = 'Cmp-NvimLsp' },

    { 'rafamadriz/friendly-snippets', name = 'Friendly-Snippets' },

    { 'FelipeLema/cmp-async-path', name = 'Cmp-AsyncPath' },

    { 'hrsh7th/cmp-cmdline', name = 'Cmp-Cmdline' },

    { 'hrsh7th/cmp-buffer', name = 'Cmp-Buffer' },

    { 'onsails/lspkind.nvim', name = 'Lspkind' },
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        scrollbar = false,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Codeium = '❴⁘❵' },
          menu = {
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            latex_symbols = '[Latex]',
          },
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<C-y>'] = cmp.mapping.confirm({
          select = true,
        }),
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'async_path' },
        { name = 'codeium' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              local buf = vim.api.nvim_get_current_buf()
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size > 1024 * 1024 then -- 1 Megabyte max
                return {}
              end
              return { buf }
            end,
          },
        },
      },
    })
    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })
  end,
}
