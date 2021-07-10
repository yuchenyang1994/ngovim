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
  -- Search
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "tjdevries/astronauta.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    config = [[require('module.telescope')]],
  }

  use { "nvim-telescope/telescope-project.nvim" }
  -- UI
  use { "christianchiarulli/nvcode-color-schemes.vim", opt = true }
  use { 
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      opt = true,
      event = "BufRead",
      config = [[require('module.treesitter')]]
  }
  use {"p00f/nvim-ts-rainbow", opt=true}
  use 'folke/tokyonight.nvim'
  use {"glepnir/dashboard-nvim",
   event="BufWinEnter",
   config = function ()
    require("module.dashboard").config()
  end}
  -- UI/icon
  use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  })
  -- UI/lualine
  use({
    "hoob3rt/lualine.nvim",
    event = "VimEnter",
    config = [[require('module.lualine')]],
    wants = "nvim-web-devicons",
  })
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
