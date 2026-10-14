
# NeoStorm

__The Neovim Configuration Inspired by PhpStorm__ 

As a PhpStorm user, It's amazing how much it can help you write great code. I'm
also a fan of Neovim. While PhpStorm has the best Vim-bindings support across
IDEs, There are still times when it doesn't do what I want. This project
approaches the issue from the opposite direction — to put PhpStorm support into
my Neovim.

> [!IMPORTANT]
> **Hypothesis**: Can one create an IDE in Neovim, using the same keyboard
> shortcuts as PhpStorm? 

I think it should be possible. However, I suspect there may be some keystroke
combinations used in PhpStorm that will get captured by the Terminal
application, or the shell itself. The default keymaps for PhpStorm should
trigger similr, if not the same behavior, in Neovim. Some interpretation will
be necessary since the fixed width characters and UI drawing utilities of the
terminal, will naturally display differently.

I don't want to duplicate every panel used in PhpStorm, e.g. the Database
panel. *The goal is to focus on the code editing experience* — so LSP, code
refactoring, Recent files, linting, code formatting, etc. 

This goal is *No configuration needed*. As Neovims, we do love to tweak our
config. So let the user create a `~/.config/nvim/neostorm-user.lua`
configuration file to add their own configuraiton settings and leader mappings. 

## LANGUAGE PRIORITY

1. PHP programming
2. HTML/CSS
3. SQL
4. Bash

## Version

The current version is 0.0.0. This project uses [semantic versioning](http://semver.org).

## Features

* First feature
* Second feature
* Third feature

## Ideas for sections/pages

* Language Translations 
* Frequently Asked Questions (FAQ)
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

