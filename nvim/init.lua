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
  FUNCTIONS
  =============================================================
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
    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim
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

--[[
  =============================================================
  SECTION 2: Plugins
  =============================================================
  Pluins are managed by the lazy.nvim plugin manager
--]]

do
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end ---@diagnostic disable-next-line: undefined-field

    local rtp = vim.opt.rtp
    rtp:prepend(lazypath)

    require("lazy").setup({
        {
            -- Display TODO, NOTE, HACK, FIX and WARNING as highlighted text in comments
            "folke/todo-comments.nvim",
            opts = { signs = false },
        },
        {
            "akinsho/toggleterm.nvim",
            event = "VeryLazy",
            version = "*",
            hide_numbers = true,
            opts = {
                size = 12,
                open_mapping = "<A-F12>",
            },
            float_opts = {
                title_pos = "left",
            },
        },
    }, {
        ui = {
            -- If you are using a Nerd Font: set icons to an empty table which will use the
            -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
            icons = vim.g.have_nerd_font and {} or {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
            },
        },
    })
end
