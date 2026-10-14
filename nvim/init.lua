--[[

NeoStorm

The Neovim Configuration Inspired by PhpStorm 

As a PhpStorm user, It's amazing how much it can help you write great code. I'm
also a fan of Neovim. While PhpStorm has the best Vim-bindings support across
IDEs, There are still times when it doesn't do what I want. This project
approaches the issue from the opposite direction — to put PhpStorm support into
my Neovim.

--]]

--[[
  =============================================================
  SECTION 0: Getting Help
  =============================================================
   NOTE: The docs provide a lot of information to configure
    Neovim as you like. The pages are great starting points.
    See `:help mapleader`
    See `:help vim.o`
    See `:help vim.opt`
    See `:help option-list`
    See `:help clipboard`
    See `:help list`
    See `:help listchars`
    See `:help lua-options`
    See `:help lua-guide-options`
    See `:help confirm`
--]]

--[[
  =============================================================
  SECTION 1: Core Options
  =============================================================
--]]

do
    vim.loader.enable()
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    vim.g.have_nerd_font = false
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.mouse = "a"
    vim.o.showmode = false
    vim.o.breakindent = true
    vim.o.undofile = true
    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.signcolumn = "yes"
    vim.o.updatetime = 250
    vim.o.timeoutlen = 300
    vim.o.splitright = true
    vim.o.splitbelow = true
    vim.o.list = true
    vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
    vim.o.inccommand = "split"
    vim.o.cursorline = true
    vim.o.scrolloff = 8
    vim.o.confirm = true
    -- May need to remove these tab settings in the future, they're useful for
    -- the time being.
    vim.o.textwidth = 80
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
end
