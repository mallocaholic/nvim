-- General keymaps that are not pluggin dependant
local Utils = require('user.utils')

-- local exprnnoremap = Utils.exprnnoremap
local noremap = Utils.noremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.nmap
local xmap = Utils.xmap
local vmap = Utils.vmap
local map = Utils.map

nmap("<space>", "<leader>")

-- MANUAL:

-- nmap("<leader>r", ":so ~/.config/nvim/init.lua<CR>")
-- nnoremap("<leader>e", ":PlugInstall<CR>")
-- nnoremap("<leader>q", ":q<CR>")

-- Plugins ---------------------------------------
-- MvVis
vnoremap("<A-h>", "<Plug>(MvVisLeft)")
vnoremap("<A-j>", "<Plug>(MvVisDown)")
vnoremap("<A-k>", "<Plug>(MvVisUp)")
vnoremap("<A-l>", "<Plug>(MvVisRight)")

-- Sandwich
nmap("si", "<Plug>(sandwich-add)")
xmap("si", "<Plug>(sandwich-add)")
nmap("sd", "<Plug>(sandwich-delete)")
xmap("sd", "<Plug>(sandwich-delete)")
nmap("sr", "<Plug>(sandwich-replace)")
xmap("sr", "<Plug>(sandwich-replace)")
-- End Plugins ---------------------------------------

-- Macro over visual
vim.cmd[[
  xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

  function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction

]]

-- Save with Ctrl + S
nnoremap("<C-s>", ":w<CR>")

-- Page up/down with recentering
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- Splits
nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- Yank to end of line
nnoremap("Y", "y$")

-- When join a line, don't add space
-- nnoremap("J", "mzJx`z")

-- Disable hl with 2 esc
-- nnoremap("<silent><esc>", "<esc>:noh<CR><esc>")
-- vnoremap("<silent><esc>", "<esc>:noh<CR><esc>")
-- inoremap("<silent><esc>", "<esc>:noh<CR><esc>")


-- Run omnifunc, mostly used for autocomplete
-- inoremap("<C-SPACE>", "<C-x><C-o>")


-- Switch buffers (needs nvim-bufferline)
-- nnoremap("<TAB>", ":BufferLineCycleNext<CR>")
-- nnoremap("<S-TAB>", ":BufferLineCyclePrev<CR>")

-- Populate substitution
-- nnoremap("<leader>s", ":s//g<Left><Left>")
-- nnoremap("<leader>S", ":%s//g<Left><Left>")
-- nnoremap("<leader><C-s>", ":%s//gc<Left><Left><Left>")
-- vnoremap("<leader>s", ":s//g<Left><Left>")
-- vnoremap("<leader><A-s>", ":%s//g<Left><Left>")
-- vnoremap("<leader>S", ":%s//gc<Left><Left><Left>")

-- Delete buffer
-- nnoremap("<A-w>", ":bd<CR>")


-- Paste into selection without overwriting p register
xnoremap("<leader>p", '\"_dP')

-- Delete without overwriting register
-- nnoremap("<leader>d", '\"_d')
-- vnoremap("<leader>d", '\"_d')

-- Different register for delete and paste
nnoremap("d", '\"_d')
vnoremap("d", '\"_d')
vnoremap("p", '\"_dP')
nnoremap("x", '\"_x')
nnoremap("P", '\"_d')
vnoremap("<LeftRelease>", '\"+y<LeftRelease>')

-- Copy to system clippboard
nnoremap("y", '\"+y')
vnoremap("y", '\"+y')
vnoremap("<C-c>", '\"+y') -- Windows behavior

-- Paste from system clippboard
nnoremap("p", '\"+p')
vnoremap("p", '\"+p')
vnoremap ("<C-v>", '\"+p') -- Windows behavior

-- Easy motion for begin and end lines
nnoremap("L", "$")
nnoremap("H", "^")
vnoremap("L", "$")
vnoremap("H", "^")

-- Select ocurrence and replace
nnoremap("R", "*``cgn")
vim.cmd[[xnoremap R y<cmd>let @/=escape(@", '/')<cr>"_cgn]]
