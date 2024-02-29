--[[ $$$$$$$            /$$       /$$                           /$$   /$$            /$$
   | $$__  $$          |__/      | $$                          | $$$ | $$           |__/
   | $$  \ $$  /$$$$$$  /$$  /$$$$$$$  /$$$$$$   /$$$$$$       | $$$$| $$ /$$    /$$ /$$ /$$$$$$/$$$$
   | $$$$$$$/ /$$__  $$| $$ /$$__  $$ |____  $$ /$$__  $$      | $$ $$ $$|  $$  /$$/| $$| $$_  $$_  $$
   | $$__  $$| $$$$$$$$| $$| $$  | $$  /$$$$$$$| $$  \__/      | $$  $$$$ \  $$/$$/ | $$| $$ \ $$ \ $$
   | $$  \ $$| $$_____/| $$| $$  | $$ /$$__  $$| $$            | $$\  $$$  \  $$$/  | $$| $$ | $$ | $$
   | $$  | $$|  $$$$$$$| $$|  $$$$$$$|  $$$$$$$| $$            | $$ \  $$   \  $/   | $$| $$ | $$ | $$
   |__/  |__/ \_______/|__/ \_______/ \_______/|__/            |__/  \__/    \_/    |__/|__/ |__/ |__/
   
     /$$$$$$                       /$$$$$$  /$$
    /$$__  $$                     /$$__  $$|__/
   | $$  \__/  /$$$$$$  /$$$$$$$ | $$  \__/ /$$  /$$$$$$
   | $$       /$$__  $$| $$__  $$| $$$$    | $$ /$$__  $$
   | $$      | $$  \ $$| $$  \ $$| $$_/    | $$| $$  \ $$
   | $$    $$| $$  | $$| $$  | $$| $$      | $$| $$  | $$
   |  $$$$$$/|  $$$$$$/| $$  | $$| $$      | $$|  $$$$$$$
    \______/  \______/ |__/  |__/|__/      |__/ \____  $$
                                             /$$  \ $$
                                            |  $$$$$$/
                                             \______/ ]]
--
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("lazy").setup("plugins")
