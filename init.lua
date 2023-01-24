-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local packer_bootstrap = require('bootstrap').packer

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'Mofiqul/dracula.nvim'

	-- NOTE: Make sure to install ripgrep too in the terminal
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

	-- Include tree sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
		end,
	}

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.keymap.set('n', '<Leader>p', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>')

-- Window navigation shortcuts for Ctrl-<direction> instead of Crtl-w <direction>
vim.keymap.set({'n', 'v', 'i'}, '<C-h>', '<C-w>h')
vim.keymap.set({'n', 'v', 'i'}, '<C-j>', '<C-w>j')
vim.keymap.set({'n', 'v', 'i'}, '<C-k>', '<C-w>k')
vim.keymap.set({'n', 'v', 'i'}, '<C-l>', '<C-w>l')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-S-p>', builtin.live_grep, {})

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Set up relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = 'longest,list'

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd[[colorscheme dracula]]

require('nvim-web-devicons')
require('nvim-tree').setup({
	open_on_setup = true,
	ignore_buffer_on_setup = true,
	ignore_ft_on_setup = { "gitcommit", },
	filters = { custom = { "^.git$" } }
})

require('lualine').setup()
