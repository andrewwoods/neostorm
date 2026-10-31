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
    See `:help map-alt-keys`
    See `:help map-super-keys`
    See `:help map-cmd-key`
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
    See `:help telescope` and `:help telescope.setup()`
    See `:help telescope.builtin`
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
        --[[
          Load default colorscheme AKA themes for the user to choose from.
        --]]
        { "Mofiqul/dracula.nvim" },
        { "projekt0n/github-nvim-theme" },
        { "morhetz/gruvbox" },
        { "catppuccin/nvim" },

        --[[
          Load plugins to enhance Neovim
        --]]
        { "neovim/nvim-lspconfig" },
        { "mason-org/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = { signs = true,
              search = {
                command = "rg",
                pattern = [[(@?(KEYWORDS):)]], 
              },
              keywords = {
                TODO = { icon = " ", color = "hint", alt = { "INFO" } },
              },
              highlight = {
                    pattern = [[.*<(\@?(KEYWORDS):?)]], 
              },
           },
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

        {
            "nvim-telescope/telescope.nvim",
            event = "VimEnter",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                { 
                    "nvim-telescope/telescope-fzf-native.nvim",
                    build = "make",
                    cond = function()
                        return vim.fn.executable("make") == 1
                    end,
                },
                { "nvim-telescope/telescope-ui-select.nvim" },
                { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
            },
            config = function()
                require("telescope").setup({
                    extensions = {
                        ["ui-select"] = {
                            require("telescope.themes").get_dropdown(),
                        },
                    },
                })

                -- Enable Telescope extensions if they are installed
                pcall(require("telescope").load_extension, "fzf")
                pcall(require("telescope").load_extension, "ui-select")

                local builtin = require("telescope.builtin")

                vim.keymap.set("n", "<leader>O", builtin.find_files, { desc = "Open Files (Leader+Shift+O)" })

                vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]roject [F]iles" })
                vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "[P]roject Files Tracked by [G]it" })

                vim.keymap.set("n", "<leader>e", builtin.oldfiles, { desc = "Open Recent Files (Leader+E) " })

                vim.keymap.set("n", "<leader>se", builtin.live_grep, { desc = "[S]earch [E]verywhere " })

                vim.keymap.set("n", "<leader>s.", function()
                    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end, { desc = "Fuzzily [S]earch [c]urrent File" })

                vim.keymap.set("n", "<leader>s/", function()
                    builtin.live_grep({
                        grep_open_files = true,
                        prompt_title = "Live  in Open Files",
                    })
                end, { desc = "[S]earch [/] in Open Files" })

                vim.keymap.set("n", "<leader>ut", builtin.colorscheme, { desc = "UI: List Themes" })
                vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "List Open Files" })

                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
                    callback = function(event)
                        local buf = event.buf

                        vim.keymap.set("n", "<leader>2", builtin.lsp_document_symbols, { desc = "Structure" })

                        vim.keymap.set(
                            "n",
                            "<M-F7>",
                            builtin.lsp_references,
                            { buffer = buf, desc = "Find Usages for current word" }
                        )

                        vim.keymap.set(
                            "n",
                            "<leader>b",
                            builtin.lsp_implementations,
                            { buffer = buf, desc = "Goto Implementation" }
                        )

                        vim.keymap.set(
                            "n",
                            "<leader>B",
                            builtin.lsp_definitions,
                            { buffer = buf, desc = "Goto Definition for current word" }
                        )

                        vim.keymap.set(
                            "n",
                            "<leader>o",
                            builtin.lsp_document_symbols,
                            { buffer = buf, desc = "Open Document Symbols" }
                        )

                        vim.keymap.set(
                            "n",
                            "<leader>O",
                            builtin.lsp_dynamic_workspace_symbols,
                            { buffer = buf, desc = "Open Workspace Symbols" }
                        )
                    end,
                })
            end,
        },
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = function()
                local nvimtree = require("nvim-tree")

                -- recommended settings from nvim-tree documentation
                vim.g.loaded_netrw = 1
                vim.g.loaded_netrwPlugin = 1

                nvimtree.setup({
                    view = {
                        width = 35,
                    },
                    -- change folder arrow icons
                    renderer = {
                        indent_markers = {
                            enable = true,
                        },
                        icons = {
                            glyphs = {
                                folder = {
                                    arrow_closed = "", -- arrow when folder is closed
                                    arrow_open = "", -- arrow when folder is open
                                },
                            },
                        },
                    },
                    filters = {
                        custom = { ".DS_Store" },
                    },
                    git = {
                        ignore = false,
                    },
                })

                vim.keymap.set("n", "<leader>1", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Project files" })
            end,
        },
        {
            "andrewwoods/vim-copy-path-reference",
            config = function()
                local keymap = vim.keymap

                keymap.set(
                    "n",
                    "<leader>cb",
                    "<cmd>CopyBaseFilenameAndLineNumber<CR>",
                    { desc = "[C]opy [B]ase Filename" }
                )
                keymap.set("n", "<leader>cd", "<cmd>CopyFullDirectory<CR>", { desc = "[C]opy Full [D]irectory" })
                keymap.set("n", "<leader>cf", "<cmd>CopyFullPathAndLineNumber<CR>", { desc = "[C]opy [F]ull Path" })
                keymap.set(
                    "n",
                    "<leader>cp",
                    "<cmd>CopyRelativePathAndLineNumber<CR>",
                    { desc = "[C]opy Relative [P]ath" }
                )
                keymap.set(
                    "n",
                    "<leader>cr",
                    "<cmd>CopyRelativeDirectory<CR>",
                    { desc = "[C]opy [R]elative Directory" }
                )
            end,
        },
        {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup({
                    -- Delay between pressing a key and opening which-key (milliseconds)
                    delay = 0,
                    icons = { mappings = vim.g.have_nerd_font },
                    -- Document existing key chains
                    spec = {},
                })
            end,
        },
        {
            "mfussenegger/nvim-lint",
            opts = {
                linters_by_ft = {
                    sh = { "shellcheck" },
                    bash = { "shellcheck" },
                    py = { "pylint" },
                    php = { "phpantom" },
                },
            },
            config = function() end,
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

--[[
  ============================================================
  SECTION 3: UI / CORE UX Settings
  ============================================================
--]]
do
    vim.cmd.colorscheme("dracula")

    -- Keep the search result centered
    vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search result" })
    vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to prev search result" })

    -- Move visually selected lines up and down
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

    -- yanks text into the System Clipboard
    vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
    vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])

    -- Delete the text for good by using the Black Hole register
    vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {
        desc = "Delete text using the Black Hole Register",
    })
    -- Quit normally
    vim.keymap.set("n", "Q", "<cmd>q<cr>", { desc = "[Q]uit" })

    -- Highlight when yanking (copying) text
    vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
        callback = function()
            --  See `:help vim.highlight.on_yank()`
            vim.highlight.on_yank()
        end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-refactor-keymaps", { clear = true }),
        callback = function(event)
            vim.keymap.set(
                { "n", "v" },
                "<leader>r.",
                vim.lsp.buf.code_action,
                { buffer = event.buf, desc = "Refactor: Code Actions" }
            )
            vim.keymap.set(
                "n",
                "<leader>rn",
                vim.lsp.buf.rename,
                { buffer = event.buf, desc = "Refactor: Rename symbol" }
            )
        end,
    })
end

--[[
  ============================================================
  SECTION 4: LSP Servers
  ============================================================
--]]

do
    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --  See `:help lsp-config` for information about keys and how to configure
    ---@type table<string, vim.lsp.Config>
    local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},
        shellcheck = {},
        markdownlint = {},
        -- tsc = {},
        --
        -- Some languages (like rust) have entire language plugins that can be useful:
        --    https://github.com/mrcjkb/rustaceanvim
        --
        -- But for many setups, the LSP (`rust_analyzer`) will work just fine
        -- rust_analyzer = {},
        -- @TODO: Determine if I need this for PHPantom
        --  phpantom = {},
        stylua = {}, -- Used to format Lua code

        -- Special Lua Config, as recommended by neovim help docs
        lua_ls = {
            on_init = function(client)
                client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
                client.config.settings.Lua = vim.tbl_deep_extend("force", current_settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                        path = { "lua/?.lua", "lua/?/init.lua" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                        --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                })
            end,
            ---@type lspconfig.settings.lua_ls
            settings = {
                Lua = {
                    format = { enable = false }, -- Disable formatting (formatting is done by stylua)
                },
            },
        },
    }

    -- Automatically install LSPs and related tools to stdpath for Neovim
    require("mason").setup({})

    -- Translates between nvim-lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
    require("mason-lspconfig").setup({
        automatic_enable = false, -- Change this to true if you want to automatically enable servers that are installed manually (e.g. via :Mason / :MasonInstall)
    })

    -- Ensure the servers and tools above are installed
    --
    -- To check the current status of installed tools and/or manually install
    -- other tools, you can run
    --    :Mason
    --
    -- You can press `g?` for help in this menu.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
        -- You can add other tools here that you want Mason to install
    })

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
    end
end

--[[
  =============================================================
  SECTION N: General Keymaps
  =============================================================
--]]

vim.keymap.set("n", "<leader>t", "<CMD>TodoQuickFix keywords=TODO,FIX,FIXME<CR>", { desc = "TODO" })

