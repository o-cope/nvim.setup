-- Adds basic options and keymaps for neovim
require 'core.options'
require 'core.keymaps'
-- Adds custom command ssm for ssma file compilation
require 'commands.ssm'

-- Sets up plugin manager
vim.g.python3_host_prog = '/usr/bin/python3'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- Add plugins here
  require 'plugins.none-ls',
  require 'plugins.neotree',
  require 'plugins.colourtheme',
  require 'plugins.bufdelete',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.gitcandp',
  require 'plugins.vim-tmux-navigator',
}
