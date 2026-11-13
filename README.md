
# NeoStorm

__The Neovim Configuration Inspired by PhpStorm__ 

As a PhpStorm user, It's amazing how much it can help you write great code. I'm
also a fan of Neovim. While PhpStorm has the best Vim-bindings support across
IDEs, There are still times when it doesn't do what I want. This project
approaches the issue from the opposite direction — to put PhpStorm support into
my Neovim. More precisely, make Neovim act like PhpStorm.

> [!IMPORTANT]
> **Hypothesis**: Can one create an IDE in Neovim, using the same keyboard
> shortcuts as PhpStorm? 

I think it should be possible. However, I suspect there may be some keystroke
combinations used in PhpStorm that will get captured by the Terminal
application, or the shell itself. The default keymaps for PhpStorm should
trigger similar, if not the same behavior, in Neovim. Some interpretation will
be necessary since the fixed width characters and UI drawing utilities of the
terminal, will naturally display differently.

I don't want to duplicate every panel used in PhpStorm, e.g. the Database
panel. *The goal is to focus on the code editing experience* — so LSP, code
refactoring, Recent files, linting, code formatting, etc. 

This goal is *No configuration needed*. As Neovims, we do love to tweak our
config. So let the user create a `~/.config/nvim/neostorm-user.lua`
configuration file to add their own configuraiton settings and leader mappings. 

## LANGUAGE PRIORITY

1. Markdown
1. PHP programming
1. Bash
1. Python
1. HTML/CSS
1. Javascript
1. SQL
1. Typescript

## Version

The current version is 0.0.0. This project uses [semantic versioning](http://semver.org).


## Table of Contents

* Frequently Asked Questions (FAQ)
* Keymaps

## Issues to create

* Create a **Scratches** Directory (Add, remove, file picker) uses `$XDG_DATA_HOME`) for project independent files.
* Add `<leader>2` **Bookmarks panel**: Use a plugin to visualize breakpoints
* Add `<leader>4` **Run panel**:
* Add `<leader>5` **Debug panel**:
* Add `<leader>6` **Problems panel**:
* Add `<leader>8` **Database panel**: Maybe something else; Maybe use LazySQL
* Is there a **Regex Tester** plugin I could add?
* Write config examples for overwriting main config e.g. Use WordPress setting with `exrc` option enabled and `.nvim.lua` file.
* Write keymap for a user plugin e.g. `require('awoods.keymaps')`
* Add Harpoon support
* Add Undotree support (Is there a better undotree UI than the default?)
* Document Config File settings

## Features

* Powered by Telescope (RipGrep and FZF)
* Default Themes support (**darcula**, catpuccin, dracula, github, gruvbox)
* Quickfix Support
* Copy Path Reference
* Code Refactoring
* Search Manpages and Neovim Help
* File Explorer Panel
* TODO Comments Panel
* Git changes navigation
* Terminal Panel
* Language-based Autoformat upon save
* Language-based code linting upon save
* LazyGit integration
* Live rendered markdown similar to Obsidian
* Copy File and Directory Paths
* Dynamic keymap menu via which-key



## Ideas for sections/pages

* Language Translations 
* Screenshots
* Submit Issues

## Installation

* Put your code into _src_
* [Create a Git Ignore](https://www.gitignore.io/) file
    - Add the phpdocs directory to your .gitignore file
    - Add Editor-specific files to your .gitignore ( .swp for Vim, .idea for PHPStorm, etc. )
* Select an [Open Source License](http://opensource.org/licenses) and copy it to LICENSE.txt
* Update [CONTRIBUTING.md](docs/CONTRIBUTING.md) to match your project needs

## Resources

* [Semantic Versioning](http://semver.org)
* [GitHub Markdown](https://help.github.com/categories/writing-on-github/)
* [Contributing Guidelines](https://help.github.com/articles/setting-guidelines-for-repository-contributors/)
* [Changelog](docs/CHANGELOG.md)
* [Humans TXT](http://humanstxt.org/) 
* [Robots TXT](http://www.robotstxt.org/) 
* [Git Ignore Generator](https://www.gitignore.io/)
* [Open Source Licenses](http://opensource.org/licenses/GPL-3.0)

## Credits and Acknowledgments

* Project Creator:  [Andrew Woods](https://andrewwoods.net)

