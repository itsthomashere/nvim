require("dacbui308.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("dacbui308.plugins")

function Transparent(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })

	vim.api.nvim_set_hl(0, "NormalSB", { bg = "none", ctermfg = "none" })
end

Transparent()
