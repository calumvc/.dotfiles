local opt = vim.opt

-- create global keyboard
-- lets me yank straight to clipboard
opt.clipboard:append("unnamedplus")

-- line numbers
opt.number = true

-- leader for keybinds and stuff
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- cmd stuff
opt.title = true
opt.showcmd = true
opt.cmdheight = 0

-- bits and bobs
opt.backspace = '2'
opt.laststatus = 2
opt.cursorline = true
opt.autoread = true

-- tab settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings (when using / or ?)
opt.ignorecase = true
opt.smartcase = true

