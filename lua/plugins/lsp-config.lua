return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  name = 'LSP-Config',
  dependencies = {
    { 'williamboman/mason.nvim', name = 'Mason' },
    { 'williamboman/mason-lspconfig.nvim', name = 'Mason-LSPConfig' },
    { 'j-hui/fidget.nvim', name = 'Fidget', opts = {} },
    { 'sigmasd/deno-nvim', name = 'Deno' },
    { 'pmizio/typescript-tools.nvim', name = 'Typescript-Tools' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', name = 'Mason Tool Installer' },
  },
  config = function()
    require('lspconfig.ui.windows').default_options.border = 'single'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('LspConfig', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
      'biome',
      'eslint',
      'bashls',
      'tsserver',
      'prettierd',
      'shellcheck',
      'luacheck',
    })
    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup({
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            autostart = server.autostart,
          })
        end,
        ['biome'] = function()
          require('lspconfig').biome.setup({
            root_dir = require('lspconfig').util.root_pattern('biome.json'),
            single_file_support = false,
          })
        end,
        ['tsserver'] = function ()
          require('lspconfig').tsserver.setup({
            autostart = false,
          })
        end,
        ['eslint'] = function ()
          require('lspconfig').eslint.setup({
            root_dir = require('lspconfig').util.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json'),
          })
        end
      },
    })

    -- [[ Rust Analyzer config ]]
    require('lspconfig').rust_analyzer.setup({
      capabilities = capabilities,
    })

    -- [[ Typescript Tools plugin config ]]
    local ts_tools = require('typescript-tools')
    ts_tools.setup({
      cmd = { 'typescript-language-server', '--stdio' },
      capabilities = capabilities,
      root_dir = require('lspconfig').util.root_pattern('package.json', 'tsconfig.json'),
      single_file_support = false,
    })

    -- [[ Deno plugin config ]]
    require('deno-nvim').setup({
      server = {
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc'),
        settings = {
          deno = {
            inlayHints = {
              parameterNames = {
                enabled = 'all',
              },
              parameterTypes = {
                enabled = true,
              },
              variableTypes = {
                enabled = true,
              },
              propertyDeclarationTypes = {
                enabled = true,
              },
              functionLikeReturnTypes = {
                enabled = true,
              },
              enumMemberValues = {
                enabled = true,
              },
            },
          },
        },
      },
    })
  end,
}
