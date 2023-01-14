local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install/load my plugins
return require('packer').startup(function(use)
  -- My plugins here
  use {'github/copilot.vim'} -- config is in after/plugin/copilot.vim
  use 'conweller/findr.vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  -- use 'ggandor/lightspeed.nvim'
  -- use 'wellle/targets.vim'
  use {'francoiscabrol/ranger.vim', 
    config = function()
      -- disable <leader>f keymap
      vim.g.ranger_map_keys = 0
      -- open ranger when vim open a directory
      -- vim.g.ranger_replace_netrw = 1
    end
  }
  use { 'alexghergh/nvim-tmux-navigation', config = function()
    -- TODO: put this elsewhere
          local nvim_tmux_nav = require('nvim-tmux-navigation')
          nvim_tmux_nav.setup {
              disable_when_zoomed = true -- defaults to false
          }
          vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
          vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
          vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
          vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
          vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
          vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
      end
  }
  use {'jalvesaq/Nvim-R', ft = {'r', 'rmd'}}
  use {'nvim-orgmode/orgmode',
    requires = { {'nvim-treesitter/nvim-treesitter'} },
    config = function()
      require('orgmode').setup{}
      require('orgmode').setup_ts_grammar{}
      -- require('orgmode').setup({
      --   org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
      --   org_default_notes_file = '~/Dropbox/org/refile.org',
      -- })
    end,
  }

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- From LunarVim/nvim-basic-ide
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  -- use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" } -- Projects support
  -- use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  -- use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
  -- use { "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac" }
  -- Colorschemes
  -- use 'joshdick/onedark.vim'
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
