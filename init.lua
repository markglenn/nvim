-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local packer_bootstrap = require('bootstrap').packer

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'Mofiqul/dracula.nvim'
	use 'tpope/vim-fugitive'
	use { 'lewis6991/gitsigns.nvim' }

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

require('keybindings')
require('vim-options')

vim.cmd[[colorscheme dracula]]

require('nvim-web-devicons')
require('nvim-tree').setup({
	open_on_setup = true,
	ignore_buffer_on_setup = true,
	ignore_ft_on_setup = { "gitcommit", },
	filters = { custom = { "^.git$" } }
})

require('lualine').setup()
require('gitsigns').setup()
