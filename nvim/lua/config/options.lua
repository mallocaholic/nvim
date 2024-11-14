vim.g.mapleader = ' '
vim.g.do_file_type_lua = 1

local opt = vim.opt

opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
opt.completeopt = 'menu,menuone,noselect'
opt.cursorline = true
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.jumpoptions = 'view'
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.mouse = 'a'
opt.number = true
opt.ruler = false
opt.scrolloff = 4
opt.pumblend = 10
opt.conceallevel = 2
opt.confirm = true
opt.expandtab = true
opt.pumheight = 10
opt.relativenumber = true
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opt.shiftround = true
opt.shiftwidth = 2
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { 'en' }
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.splitbelow = true
opt.splitkeep = 'screen'
opt.splitright = true
opt.virtualedit = 'block'
opt.wildmode = 'longest:full,full'
opt.winminwidth = 5
opt.wrap = false
opt.smoothscroll = true
