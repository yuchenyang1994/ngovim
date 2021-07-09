local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

return require("packer").startup(function(use)
  -- BASE
  use "wbthomason/packer.nvim"

  -- lsp
  use { "neovim/nvim-lspconfig" }
  use { "kabouzeid/nvim-lspinstall", event = "VimEnter" }
  -- telescope
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "tjdevries/astronauta.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    config = [[require('module.telescope')]],
  }

  use { "nvim-telescope/telescope-project.nvim" }
  -- theme
  use { "christianchiarulli/nvcode-color-schemes.vim", opt = true }
  use { "nvim-treesitter/nvim-treesitter" }
 	use 'folke/tokyonight.nvim'
  use {"glepnir/dashboard-nvim",
   event="BufWinEnter",
   config = function ()
    require("module.dashboard").config()
  end}

  use {
    "p00f/nvim-ts-rainbow",
  }
  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("module.compe").config()
    end,
  }
  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
  use { "rafamadriz/friendly-snippets", event = "InsertEnter" }
  use {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }
  use { "RRethy/nvim-treesitter-textsubjects" }
 use { "mfussenegger/nvim-ts-hint-textobject", event = "BufRead" }
  -- tree files
  use {
    "kyazdani42/nvim-tree.lua",
    -- event = "BufEnter",
    -- cmd = "NvimTreeToggle",
    commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
    config = function()
      require("module.tree").config()
    end,
  }
  -- whichkey
  use {
    "folke/which-key.nvim",
    config = function()
      require "module.whichkey"
    end,
  }
end
)
