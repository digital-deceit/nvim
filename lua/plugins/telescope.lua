return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-telescope/telescope-file-browser.nvim', name = 'File Browser' },
    { 'nvim-lua/plenary.nvim', name = 'Plenary' },
    { 'nvim-telescope/telescope-ui-select.nvim', name = 'Telescope UI Select' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      name = 'Telescope FZF Native',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 },
          vertical = { width = 0.9 },
          bottom_pane = { height = 70 },
        },
      },
      mappings = {
        i = { ['<c-enter>'] = 'to_fuzzy_refine', ['<C-h>'] = 'which_key' },
      },
      extensions = {
        file_browser = {
          hidden = {
            file_browser = true,
            folder_browser = true,
          },
          previewer = false,
          hijack_netrw = true,
          results_height = 20,
          width = 1,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })
    pcall(require('telescope').load_extension, 'file_browser')
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ts', builtin.treesitter, { desc = '[T]ree[s]itter' })
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set(
      'n',
      '<leader>/',
      builtin.current_buffer_fuzzy_find,
      { desc = '[/] Fuzzily search in current buffer' }
    )
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Files' })
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>vo', builtin.vim_options, { desc = '[V]im [O]ptions' })
    vim.keymap.set('n', '<leader>mr', builtin.marks, { desc = '[M]arks' })
    vim.keymap.set('n', '<leader>cm', builtin.commands, { desc = '[C]ommands' })
    vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = '[C]ommands [H]istory' })
    vim.keymap.set(
      'n',
      '<leader>fb',
      '<cmd>Telescope file_browser<CR>',
      { desc = '[F]ile [B]rowser' }
    )
    vim.api.nvim_set_keymap(
      'n',
      '<space>cb',
      ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
      { noremap = true }
    )
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
