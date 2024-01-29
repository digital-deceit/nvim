return {
  'stevearc/conform.nvim',
  name = 'Conform',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>ff',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      desc = '[F]ormat [F]ile',
    },
  },
  config = function()
    local conform = require('conform')

    conform.formatters.biome = function()
      return {
        cwd = require('conform.util').root_file({ 'biome.json' }),
        require_cwd = true,
      }
    end

    conform.formatters.deno_fmt = function()
      return {
        cwd = require('conform.util').root_file({ 'deno.json', 'deno.jsonc' }),
        require_cwd = true,
      }
    end

    conform.formatters.prettierd = function()
      return {
        cwd = require('conform.util').root_file({
          '.prettierrc',
          '.prettierrc.json',
          '.prettier.js',
          '.prettier.config.js',
          '.prettier.cjs',
          '.prettier.mjs',
          '.prettierrc.toml',
        }),
        require_cwd = true,
      }
    end

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        cs = { 'csharpier' },
        go = { 'gofmt', 'gofumpt', 'golines', 'goimports-reviser' },
        c = { 'clang-format' },
        rust = { 'rustfmt' },
        typescript = { { 'biome', 'prettierd' } },
        javascript = { { 'biome', 'prettierd' } },
      },

      -- Define a command to run async formatting
      -- vim.api.nvim_create_user_command('Format', function(args)
      --   local range = nil
      --   if args.count ~= -1 then
      --     local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      --     range = {
      --       start = { args.line1, 0 },
      --       ['end'] = { args.line2, end_line:len() },
      --     }
      --   end
      --   conform.format({ async = true, lsp_fallback = true, range = range })
      -- end, { range = true }),
    })
  end,
}
