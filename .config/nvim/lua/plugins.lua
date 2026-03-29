local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function (use)
	use 'wbthomason/packer.nvim'

	use 'bluz71/vim-moonfly-colors'

	use 'nvim-lua/plenary.nvim'
	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'

	--[[use {
		'tzachar/cmp-tabnine',
		run = './install.sh'
	}]]

	use 'onsails/lspkind-nvim'

	use {
		'nvim-lualine/lualine.nvim',
		config = function ()
			require('lualine').setup()
		end
	}

	use {
		'windwp/nvim-autopairs',
		config = function ()
			require('nvim-autopairs').setup()
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function ()
			require('nvim-treesitter').setup {
				install_dir = vim.fn.stdpath('data') .. '/site'
			}
			require('nvim-treesitter').install {
				'python',
				'lua',
				'cpp',
				'dart',
			}
		end
	}

	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-tree/nvim-tree.lua',
		config = function ()
			require('nvim-tree').setup()
		end
	}

	use { -- :CocInstall coc-pyright coc-lua coc-flutter
		'neoclide/coc.nvim',
		branch = 'release'
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)

