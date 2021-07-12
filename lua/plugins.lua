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
  use { "neovim/nvim-lspconfig",
        requires = {
            {"kabouzeid/nvim-lspinstall"},
        },
        config = function()
            require("module.lsp")
        end,
    }
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
  use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = [[require('module.treesitter')]],
      requires = {
        {"p00f/nvim-ts-rainbow"}
      },
  }
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
  use {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    after = { "telescope.nvim" },
    config = function()
        require("nvim-autopairs").setup()
    end,
  }
  -- tree files
  use {
    "kyazdani42/nvim-tree.lua",
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
  -- terminal
  use({
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("module.terminal")
    end,
  })
  -- git
  use({
    "TimUntersberger/neogit",
    cmd = "Neogit",
    opt = true,
    config = function()
      require("module.neogit")
    end,
  })
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup()
    end,
    event = "BufRead",
  }
  use {
    "terrortylor/nvim-comment",
    config = function()
        require('nvim_comment').setup({
            line_mapping = "<leader>;;",
            operator_mapping = "<leader>;"
        })
    end
  }
  use {
    'phaazon/hop.nvim',
     as = 'hop',
     config = function()
         require('hop').setup()
     end
  }
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup({
            hl = 'SpellBad',
            captures = {},
      })
    end
  }
end
)
