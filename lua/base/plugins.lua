-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

-- Auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- gui

  -- nvim-colorizer.lua
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('core.mv-colorizer')
    end
  }

  -- zen mode
  use {
    'folke/zen-mode.nvim',
    config = function()
      require('core.mv-zenmode')
    end
  }

  use {
    'folke/twilight.nvim',
    config = function()
      require('core.mv-twilight')
    end
  }

  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function()
        require('core.mv-galaxyline')
    end
}

-- nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('core.mv-nvimtree')
    end
  }

  -- dashboard
  use {
    'glepnir/dashboard-nvim',
    requires = 'nvim-lua/telescope.nvim',
    event = 'BufWinEnter',
    config = function()
      require("core.mv-dashboard")
    end
  }

  -- tabline
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    event = 'BufWinEnter',
    config = function()
      require('core.mv-bufferline')
    end
  }

  -- toggleterm
  use {
      "akinsho/nvim-toggleterm.lua",
    config = function()
        require('core.mv-toggleterm')
    end
  }

  use {'preservim/tagbar'}

  -- linting and intellisense
  use {
    'nvim-treesitter/nvim-treesitter',
    run  = ':TSUpdate',
    config = function()
      require('core.mv-nvim-treesitter')
    end
  }

  use {'mboughaba/i3config.vim'}

  -- completion
  -- use {
      -- 'folke/trouble.nvim',
      -- config = function()
          -- require('core.mv-trouble')
      -- end
  -- }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "Saecki/crates.nvim" },
        { "f3fora/cmp-spell" },
        -- { "hrsh7th/cmp-cmdline" },
        { "tamago324/cmp-zsh" },
    },
    config = function()
      require('core.mv-nvimcmp')
  end,
  }
  use {"wbthomason/lsp-status.nvim"}
  use {"saadparwaiz1/cmp_luasnip"}
  use {"onsails/lspkind-nvim"}
  use {'neovim/nvim-lspconfig'}
  use {"ray-x/lsp_signature.nvim",
    config = function()
        require('core.mv-lspsignature')
    end,
    }
  -- searching
  use {'kien/ctrlp.vim'}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      require('core.mv-telescope')
    end
  }

 use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('core.mv-indent')
    end
   }

 use {
    'itchyny/vim-cursorword',
    event = {'BufReadPre','BufNewFile'},
    config = function()
        require('core.mv-cursorword')
    end
  }
 -- QOL
  use {'vimwiki/vimwiki'}

  use {
    'preservim/nerdcommenter',
    config = function()
        require('core.mv-nerdcommenter')
    end
  }

  use {
    'folke/which-key.nvim',
    config = function()
        require('core.mv-whichkey')
    end
}

  use {'tpope/vim-surround'}

  use {'terryma/vim-multiple-cursors'}

  use {
    'Raimondi/delimitMate',
    event = 'InsertEnter',
    config = function()
      require('core.mv-delimitmate')
    end
  }

  -- colorschemes
  use {'nekonako/xresources-nvim'}

  use {'github/copilot.vim'}

  -- latex
  use {'lervag/vimtex'}
end)


--  automatically run :PackerCompile whenever plugins.lua is updated
-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerSync]])
