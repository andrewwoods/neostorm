
# NeoStorm

__The Neovim distribution inspired by PhpStorm__

As a PhpStorm user, who loves Neovim and the terminal, it's natural to want to
blend the two. There are some great Neovim distributions available to use.
They're all opinionated in ways that are too far from what's common in PhpStorm.

This project makes the most of modern Neovim, Telescope, the plugin ecosystem,
while taking inspiration from PhpStorm.

As a PhpStorm user, It's amazing how much it can help you write great code. I'm
also a fan of Neovim. PhpStorm has the best Vim-bindings support across IDEs.
However, there are still gaps in support in its vim support. Also, there are
times when PhpStorm is too heavy for the work I want to do on a given day. This
project approaches the issue from the opposite direction — to put the PhpStorm
into Neovim. More precisely, make Neovim act like PhpStorm while acting while
making the most of Neovim.

> [!IMPORTANT]
> **Hypothesis**: Can one create an IDE in Neovim, using the same keyboard
> shortcuts as PhpStorm? 

That's how this project started. However, many of the keystroke combinations
used in PhpStorm get captured by the Terminal application, or the shell itself.
The goal isn't to duplicate every aspect of PhpStorm, e.g. the Database panel,
the Services panel. *The goal is to focus on the code editing experience* — so
LSP, code refactoring, Recent files, linting, code formatting, etc.
Additionally, it's important to have the necessary tools (code quality, static
analysis, and debugging) installed and ready to go. Having to perform a lot of
setup is a barrier to creating high-quality professional code. Make it easy to
do the right thing.


## Version

The current version is 2026.11.01. This project uses [semantic versioning](http://semver.org).


## Table of Contents

* Frequently Asked Questions (FAQ)
* [Keymaps](docs/keymaps.md)
* [Psalm Config](docs/psalm.md)
* [PHPStan Config](docs/psalm.md)

## Issues to create

* Add `<leader>4` **Run panel**:
* Add `<leader>5` **Debug panel**:
* Add `<leader>6` **Problems panel**:
* Add `<leader>8` **Database panel**: Maybe something else; Maybe use LazySQL
* Is there a **Regex Tester** plugin I could add?
* Write config examples for overwriting main config e.g. Use WordPress setting with `exrc` option enabled and `.nvim.lua` file.
* Write keymap for a user plugin e.g. `require('awoods.keymaps')`
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


## LANGUAGE PRIORITY

1. Markdown
1. PHP programming
1. Bash
1. HTML/CSS
1. Python
1. Javascript
1. SQL
1. Typescript


## Ideas for sections/pages

* Language Translations 
* Screenshots
* Submit Issues

## Installation

> [!IMPORTANT] External Command Installation
> You'll need to include external commands. How you install them is up to you.
> Whether its via Homebrew, Apt, DNF, or a source tarball.
>
> * fzf
> * ripgrep
> * lazygit
> * psalm
>

* Download the Neostorm repo from Github to ~/opt and extract it
* Create the alias neostorm='NVIM_APPNAME="neostorm" nvim -u ~/opt/neostorm/nvim/init.lua'
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

