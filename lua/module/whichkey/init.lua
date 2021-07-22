local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return
end

which_key.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    spelling = {enabled = true, suggestions = 20}, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
}

-- Set leader
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  ["<Space>"] = {"<cmd>Telescope commands<CR>", "Commands"},
	f = {
		name = "File",
		s = {"<cmd>w!<CR>", "Save"},
		f = {"<cmd>Telescope find_files<CR>", "Find Files"},
        r = {"<cmd>Telescope oldfiles<CR>", "Recent File"},
		t = {"<cmd>lua require'module.tree'.toggle_tree()<CR>", "Toggle Tree"},
		n = {"<cmd>enew<cr>", "New File"},
	},
	s = {
	    name = "Search",
        c = {'<cmd>let @/=""<CR>', "No High light"},
	    b = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search Current"},
	    p = {"<cmd>Telescope live_grep<CR>", "Search Project"},
	    r = {"<cmd>Telescope search_history<CR>", "Search History"},
	    m = {"<cmd>Telescope marks<CR>", "Search Marks"},
        M = {"<cmd>delmarks A-Z0-9<CR>", "Clear All Marks"}
	},
	p = {
	    name = "Project",
	    p = {"<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Find Projects"},
	},
	w = {
		name = "Window",
		s = {"<cmd>split<CR>", "Split Window"},
		v = {"<cmd>vsplit<CR>", "VSplit Window"},
		d = {"<cmd>clo<CR>", "Kill Window"},
		h = {"<C-w>h", "Move Left Windows"},
		j = {"<C-w>j", "Move Down Windows"},
		k = {"<C-w>k", "Move Up Windows"},
		l = {"<C-w>l", "Move Right Windows"},
		J = {"<cmd>resize -4<CR>", "Resize Windows Down"},
		K = {"<cmd>resize +4<CR>", "Resize Windows Up"},
		H = {"<cmd>vertical resize -4<CR>", "Resize Window Left"},
		L = {"<cmd>vertical resize +4<CR>", "Resize Window Right"}
	},
	b = {
		name = "Buffer",
		b = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
		n = {"<cmd>bnext<cr>", "Next buffer"},
		p = {"<cmd>bprevious<cr>", "Previous Buffer"},
		d = { "<cmd>bd<CR>", "Delete Buffer" },
	},
	["<tab>"] = {
		name = "Workspace",
		["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },

		n = { "<cmd>tabnext<CR>", "Next" },
		d = { "<cmd>tabclose<CR>", "Close" },
		p = { "<cmd>tabprevious<CR>", "Previous" },
		f = { "<cmd>tabfirst<CR>", "First" },
		l = { "<cmd>tablast<CR>", "Last" },
	},
	q = {
		name = "+quit/session",
		q = { "<cmd>:qa<cr>", "Quit" },
		Q = { "<cmd>:qa!<cr>", "Quit without saving" },
	},
  o = {
      name = "open",
      t = {"<cmd>ToggleTerm<CR>", "Open Terminal"}
  },
  g = {
      name = "Git",
      s = {"<cmd>Neogit kind=split<CR>", "Git Status"},
      g = {"<cmd>Neogit commit kind=split<CR>", "Git Commit",}
  },
  j = {
      name = "Jump",
      w = {"<cmd>HopWord<CR>", "Jump World"},
      l = {"<cmd>HopLine<CR>", "Jump Line"},
      c = {"<cmd>HopChar1<CR>", "Jump Char1"},
      C = {"<cmd>HopChar2<CR>", "Jump Char2"},
  }
}
local wk = require "which-key"
wk.register(mappings, opts)
