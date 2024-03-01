-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- [[ Setting options ]]
-- See `:help vim.opt`
vim.opt.title = true
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true -- Make line numbers default
vim.opt.splitright = true
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 600
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- vim: ts=2 sts=2 sw=2 et
vim.opt.tabstop = 2
