local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute(
		'!git clone https://github.com/wbthomason/packer.nvim ' .. install_path
	)
end

vim.cmd [[
augroup Packer
	autocmd!
	autocmd BufWritePost ~/.config/nvim/init.lua :so %
	autocmd BufWritePost ~/.config/nvim/init.lua PackerSync
	autocmd BufWritePost ~/.config/nvim/init.lua PackerCompile
augroup end
]]

local use = require('packer').use
require("packer").startup(function()

	use {
		'lewis6991/impatient.nvim',
		rocks = "mpack"
	}

--	use({
--		"nvim-lua/plenary.nvim",
--		event = "BufRead",
--	})
--
--	use({
--		"nvim-lua/popup.nvim",
--		after = "plenary.nvim",
--		requires = { "nvim-lua/plenary.nvim"  },
--	})

	use "ahmedkhalf/project.nvim"

	use 'rktjmp/lush.nvim'

	-- Package Manager
	use 'wbthomason/packer.nvim'

	-- LSP Client
	use 'neovim/nvim-lspconfig'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons'
		}
	}

	-- Language Server installer
	use {
		'williamboman/nvim-lsp-installer',
		requires = "neovim/nvim-lspconfig",
	}

	-- Autocomplete Symbols
	use 'onsails/lspkind-nvim'
	-- lsp elements as ui
	use { 'tami5/lspsaga.nvim', requires = { 'neovim/nvim-lspconfig' } }

	-- Autocomplete Plugin
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
		},
	}

	-- snippets
	use {
		'saadparwaiz1/cmp_luasnip',
		requires = {
			'L3MON4D3/LuaSnip',
		},
	}

	-- bracket autocompletion
	use "vim-scripts/auto-pairs-gentle"

	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'arkav/lualine-lsp-progress',
		},
	}

	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	-- copilot
	use "github/copilot.vim"

	-- devcontainers
	use 'jamestthompson3/nvim-remote-containers'

	-- git
    -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'tpope/vim-fugitive', requires = 'nvim-lua/plenary.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- comment
	use 'numToStr/Comment.nvim'

	-- tag manager
	-- make sure to install universal ctags
	use 'ludovicchabant/vim-gutentags'

	-- telescope
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- indentation guides on blank lines
	use 'lukas-reineke/indent-blankline.nvim'

	-- gitsigns
	use { 'lewis6991/gitsigns.nvim', requires = { "nvim-lua/plenary.nvim" } }

	-- bufferline
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }

	-- faster filetype thing
	use 'nathom/filetype.nvim'

	-- gitlens-esque blame feature
	use 'APZelos/blamer.nvim'

	-- alpha
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
	}

	use 'simrat39/symbols-outline.nvim'

	use {
		'folke/trouble.nvim',
		requires = "kyazdani42/nvim-web-devicons",
		config = function ()
			require("trouble").setup()
		end
	}

	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {}
		end
	}

	use {
		"folke/twilight.nvim",
		config = function ()
			require("twilight").setup {}
		end
	}

	-- use 'sunjon/shade.nvim'
	use 'andweeb/presence.nvim'

	use {
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end
	}

	use {
		'ggandor/lightspeed.nvim',
		requires = "tpope/vim-repeat"
	}

	use {
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require"telescope".load_extension("frecency")
		end,
		requires = {"tami5/sqlite.lua"}
	}

	use 'chentau/marks.nvim'
	
	-- colorscheme until i get a better one
	-- use 'navarasu/onedark.nvim'
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})
end)

-- require('shade').setup({
-- 	overlay_opacity = 50,
-- 	opacity_step = 1,
-- 	keys = {
-- 		toggle = '<Leader>s',
-- 	}
-- })

require('presence'):setup({
	auto_update = true,
	neovim_image_text = "webcoredreams",
	main_image = "neovim",
	log_level = nil,
	debounce_timeout = 10,
	enable_line_number = false,
	blacklist = {},
	buttons = true,
	file_assets = {},

	editing_text = "editing %s",
	file_explorer_text = "exploring %s",
	git_commit_text = "commiting shit",
	plugin_manager_text = "managing plugin shit",
	reading_text = "viewing read-only file %s",
	workspace_text = "working on git project %s",
	line_number_text = "if i have this on yell at me"
})

local opt = vim.opt -- global
local g   = vim.g -- global for let options
local wo  = vim.wo -- window local
local bo  = vim.bo -- buffer local
local fn  = vim.fn -- access vim functions
local cmd = vim.cmd -- vim commands

local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- mouse support
opt.mouse = "a"

-- timeout length
opt.timeoutlen = 375

-- clipboard
opt.clipboard = "unnamedplus"

-- splits
opt.splitright = true
opt.splitbelow = true

-- get rid of " -- INSERT -- " because we have statusline
opt.showmode = false

-- enable autowriteall
opt.autowriteall = true

-- show line numbers
wo.number = true
wo.relativenumber = true

-- show chars at end of line
opt.list = true

-- enable break indent
opt.breakindent = true

-- case insensitive searching unless /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- decrease update time
opt.updatetime = 250

-- show signs by autocompletion plugin
wo.signcolumn = "yes"

-- termguicolors
opt.termguicolors = true

-- completeopt for better complete experience
opt.completeopt = "menu,menuone,noselect"

-- undofile
opt.undofile = true
bo.undofile = true

-- tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- zen-mode
map('n', '<C-k>z', '<cmd>ZenMode<cr>', { silent = true })


-- remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, silent = true, expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, silent = true, expr = true })

-- remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- neogit
map('n', '<leader>gs', '<cmd>G<cr>', { silent = true })
map('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', { silent = true })

-- clear highlight
map('n', '<leader>h', '<cmd>nohl<cr>', { silent = true })

-- telescope
map('n', '<leader>f', '<cmd>Telescope find_files<cr>', { silent = true })

-- alpha
map('n', '<leader>a', '<cmd>Alpha<cr>', { silent = true })

-- explorer
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { silent = true })

-- window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- keeping it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Resize with Arrows
map('n', '<C-Up>', ':resize -2<CR>', { silent = true })
map('n', '<C-Down>', ':resize +2<CR>', { silent = true })
map('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
map('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

local opts = { silent = true }

-- list diagnostics
map('n', '<leader>tt', '<cmd>TroubleToggle<cr>', opts)
map('n', '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
map('n', '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
map('n', '<leader>tq', '<cmd>TroubleToggle quickfix<cr>', opts)
map('n', '<leader>tl', '<cmd>TroubleToggle loclist<cr>', opts)
map('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>', opts)

-- save and quit
map('n', '<leader>w', '<cmd>w<cr>', opts)
map('n', '<leader>q', '<cmd>q<cr>', opts)
map('n', '<leader>Q', '<cmd>qa!<cr>', opts)

-- buffer navigation
map("n", '<S-l>', ':bnext<CR>', { silent = true })
map("n", '<S-h>', ':bprevious<CR>', { silent = true })

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==g", opts)

map("n", "<A-k>", "<Esc>:m .-2<CR>==g", opts)
-- Insert --
-- Press jk fast to enter
-- map("i", "jk", "<ESC>", opts)

-- symbols outline
map("n", "<leader>so", "<cmd>SymbolsOutline<cr>", opts)

-- Undo Breakpoints
map("n", ",", ",<c-g>u", opts)
map("n", ".", ".<c-g>u", opts)
map("n", "!", "!<c-g>u", opts)
map("n", "?", "?<c-g>u", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv=gv", opts)
map("x", "K", ":move '<-2<CR>gv=gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]


-- blamer
g.blamer_enabled = 1
g.blamer_delay = 500
g.blamer_date_format = "%d/%m/%y"
g.blamer_relative_time = 1

-- Map blankline
g.indent_blankline_char = '┊'
g.indent_blankline_filetype_exclude = { 'help', 'packer' }
g.indent_buftype_exclude = { 'terminal', 'nofile' }
g.indent_blankline_show_trailing_blankline_indent = false
require('indent_blankline').setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	}
}

-- bufferline
require("bufferline").setup {
	options = {
		mode = "buffers",
		numbers = "none",
		close_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		name_formatter = function(buf)
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name, ':t:r')
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				text_align = "center"
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = true,
	}
}

-- nvimtree
require 'nvim-tree'.setup {
	disable_netrw        = true,
	hijack_netrw         = true,
	open_on_setup        = true,
	ignore_ft_on_setup   = {},
	auto_close           = false,
	auto_reload_on_write = true,
	open_on_tab          = false,
	hijack_cursor        = false,
	update_cwd           = false,
	update_to_buf_dir    = {
		enable = true,
		auto_open = true,
	},
	diagnostics          = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	update_focused_file  = {
		enable      = true,
		update_cwd  = true,
		ignore_list = {}
	},
	system_open          = {
		cmd  = nil,
		args = {}
	},
	filters              = {
		dotfiles = false,
		custom = {}
	},
	git                  = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view                 = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {}
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	trash                = {
		cmd = "trash",
		require_confirm = true
	},
	actions              = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = false,
		}
	}
}
vim.cmd([[
    let g:nvim_tree_icons = {
        \ 'default': '',
        \ 'symlink': '',
        \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
        \   'arrow_open': "",
        \   'arrow_closed': "",
        \   'default': "",
        \   'open': "",
        \   'empty': "",
        \   'empty_open': "",
        \   'symlink': "",
        \   'symlink_open': "",
        \   }
        \ }
    ]])

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = '~' },
	}
}

-- telescope
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

require('telescope').load_extension 'fzf'

-- Comment.nvim
require('Comment').setup()

-- LspConfig
require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

-- the required servers
local servers = {
	"bashls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"html",
	"clangd",
	"vimls",
	"emmet_ls",
	"gopls"
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

-- lsp keybinds
local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true }

	-- == THE KEYMAPS == --
	-- jump to definiton
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

	-- Format Buffer
	buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

	-- Jump LSP diagnostics
	buf_set_keymap('n', '[g', ':Lspsaga diagonstic_jump_prev<CR>', opts)
	buf_set_keymap('n', ']g', ':Lspsaga diagonstic_jump_next<CR>', opts)


	-- Rename symbol
	buf_set_keymap('n', '<leader>lr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)

	-- Find References
	-- buf_set_keymap('n', 'gr', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)

	-- Doc popup scrolling
	buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
	buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
	buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

	-- codeaction
	buf_set_keymap('n', '<leader>la', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
	buf_set_keymap('v', '<leader>la', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)

	-- Floating Terminal
	-- NOTE: vim.cmd since buf_set_keymap doesnt support tnoremap
	vim.cmd [[
		nnoremap <silent> <C-t> :lua require("lspsaga.floaterm").open_float_terminal()<CR>
		tnoremap <silent> <C-t> <C-\><C-n>:lua require("lspsaga.floaterm").close_float_terminal()<CR>
	]]
end

local server_specific_opts = {
	sumneko_lua = function(opts)
		opts.settings = {
			Lua = {
				completion = { callSnippet = "Replace" },
				diagnostics = {
					globals = { 'vim' },
				},
			},
		}
	end,

	html = function(opts)
		opts.filetypes = { "html", "htmldjango" }
	end,
}

-- lsp setup finally
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
	-- keymaps, flags, and capabilities
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 }
	}

	-- server specific options
	if server_specific_opts[server.name] then
		server_specific_opts[server.name](opts)
	end

	-- and setup server
	server:setup(opts)
end)


-- Autocomplete

local lspkind = require('lspkind')
local cmp = require("cmp")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp_kinds = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			preset = 'codicons',
			sym_kind = cmp_kinds,
			menu = ({
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				luasnip = "[SNIP]",
				nvim_lua = "[LUA]",
				latex_symbols = "[LATEX]",
			}),
		}),
	},

	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},

		-- Use Tab and Shift-Tab to browse through the suggestions.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}
})

cmp.setup.cmdline('/', {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = "path" },
	}), {
		{ name = "cmdline" }
	}
})

g.autopairs = {
	['('] = ')',
	['{'] = '}',
	['['] = ']',
	['<'] = '>',
	['"'] = '"',
	["'"] = "'",
}

-- colorscheme, later.
-- require("onedark").setup({
-- 	style = "darker",
-- })
-- require("onedark").load()

-- status bar

require('lualine').setup({
	-- sections = {
	-- 	lualine_c = {
	-- 		{ 'filename', path = 1 },
	-- 		'lsp_progress'
	-- 	},
	-- },
	options = {
		theme = "catppuccin"
	}
})

require('nvim-treesitter.configs').setup {
	ensure_installed = { "python", "rust", "c", "cpp", "bash", "go", "html", "jsonc" },
	highlight = {
		enable = true,
	},
}

require("lspsaga").init_lsp_saga({
	finder_action_keys = {
		open = "<CR>",
		quit = { 'q', '<ESC>' }
	},
	code_action_keys = {
		quit = { 'q', '<ESC>' }
	},
	rename_action_keys = {
		quit = { 'q', '<ESC>' }
	},
})

-- devcontainers

-- alpha
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	-- get this from textkool.com/en/ascii-art-generator?hl=default&vl=default&font=Larry%203D%202&text=dreams
	[[  __                                             ]],
	[[ /\ \                                            ]],
	[[ \_\ \  _ __    __     __      ___ ___     ____  ]],
	[[ /'_` \/\`'__\/'__`\ /'__`\  /' __` __`\  /',__\ ]],
	[[/\ \L\ \ \ \//\  __//\ \L\.\_/\ \/\ \/\ \/\__, `\]],
	[[\ \___,_\ \_\\ \____\ \__/.\_\ \_\ \_\ \_\/\____/]],
	[[ \/__,_ /\/_/ \/____/\/__/\/_/\/_/\/_/\/_/\/___/ ]],
	[[                                                 ]],
	[[                                                 ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope frecency <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "webcoredreams"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- project
local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end
project.setup({
	---@usage set to false to disable project.nvim.
	--- This is on by default since it's currently the expected behavior.
	active = true,

	on_config_done = nil,

	---@usage set to true to disable setting the current-woriking directory
	--- Manual mode doesn't automatically change your root directory, so you have
	--- the option to manually do so using `:ProjectRoot` command.
	manual_mode = false,

	---@usage Methods of detecting the root directory
	--- Allowed values: **"lsp"** uses the native neovim lsp
	--- **"pattern"** uses vim-rooter like glob pattern matching. Here
	--- order matters: if one is not detected, the other is used as fallback. You
	--- can also delete or rearangne the detection methods.
	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },

	---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

	---@ Show hidden files in telescope when searching for files in a project
	show_hidden = false,

	---@usage When set to false, you will get a message when project.nvim changes your directory.
	-- When set to false, you will get a message when project.nvim changes your directory.
	silent_chdir = true,

	---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
	ignore_lsp = {},

	---@type string
	---@usage path to store the project history for use in telescope
	datapath = vim.fn.stdpath("data"),
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('projects')

vim.cmd [[set laststatus=3]]

require('marks').setup({
	default_mappings = true,
	builtin_marks = { ".", "<", ">", "^" },
	cyclic = true,
	force_write_shada = false,
	refresh_interval = 250,
	sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
	excluded_filetypes = {},
	bookmark_0 = {
		sign = "⚑",
		virt_text = "BM 1"
	},
	bookmark_1 = {
		sign = "⚑",
		virt_text = "BM 2"
	},
	bookmark_2 = {
		sign = "⚑",
		virt_text = "BM 3"
	},
	bookmark_3 = {
		sign = "⚑",
		virt_text = "BM 4"
	},
	bookmark_4 = {
		sign = "⚑",
		virt_text = "BM 5"
	},
	bookmark_5 = {
		sign = "⚑",
		virt_text = "BM 6"
	},
	bookmark_6 = {
		sign = "⚑",

		virt_text = "BM 7"
	},
	bookmark_7 = {
		sign = "⚑",
		virt_text = "BM 8"
	},
	bookmark_8 = {
		sign = "⚑",
		virt_text = "BM 9"
	},
	bookmark_9 = {
		sign = "⚑",
		virt_text = "BM 10"
	},
})

local catp = require("catppuccin")

catp.setup({
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "italic",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = true,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
		},
		which_key = false,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = true,
		ts_rainbow = false,
		hop = false,
		notify = true,
		telekasten = true,
		symbols_outline = true,
	}
})
catp.load()
-- vim.cmd[[
-- hi! Normal ctermbg=NONE guibg=NONE
-- hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
-- ]]

-- Lua
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left",                  -- One of 'left', 'right', 'top', 'bottom'
    width = 35,                         -- Only applies when position is 'left' or 'right'
    height = 10,                        -- Only applies when position is 'top' or 'bottom'
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256,      -- Limit the number of commits
      follow = false,       -- Follow renames (only for single file)
      all = false,          -- Include all refs under 'refs/' including HEAD
      merges = false,       -- List only merge commits
      no_merges = false,    -- List no merge commits
      reverse = false,      -- List commits in reverse order
    },
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]      = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]    = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["gf"]         = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb("goto_file_split"),    -- Open the file in a new split
      ["<C-w>gf"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      ["<leader>e"]  = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"]  = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),           -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),           -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),         -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"),   -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),            -- Stage all entries.
      ["U"]             = cb("unstage_all"),          -- Unstage all entries.
      ["X"]             = cb("restore_entry"),        -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),        -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["i"]             = cb("listing_style"),        -- Toggle between 'list' and 'tree' views
      ["f"]             = cb("toggle_flatten_dirs"),  -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"]            = cb("options"),            -- Open the option panel
      ["<C-A-d>"]       = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["y"]             = cb("copy_hash"),          -- Copy the commit hash of the entry under the cursor
      ["zR"]            = cb("open_all_folds"),
      ["zM"]            = cb("close_all_folds"),
      ["j"]             = cb("next_entry"),
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"]     = cb("close"),
    },
  },
}

-- local neogit = require("neogit")
--
-- neogit.setup {
--   kind = "tab",
--   integrations = {
--     diffview = true
--   },
--   mappings = {
--     status = {
--       ["B"] = "BranchPopup",
--     }
--   }
-- }
