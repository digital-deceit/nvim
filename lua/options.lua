local set = vim.o
local setg = vim.g
local setw = vim.wo

setg.mapleader = ' '
setg.localmapleader = ' '

set.termguicolors = true
set.number = true
set.mouse = 'a'
set.breakindent = true
set.undofile = true
set.ignorecase = true
set.smartcase = true
setw.signcolumn = 'yes'
set.updatetime = 250
set.timeout = true
set.timeoutlen = 300
set.completeopt = 'menuone,noselect'
setg.autoread = true
set.noswapfile = true
set.clipboard = 'unnamedplus'
setg.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
