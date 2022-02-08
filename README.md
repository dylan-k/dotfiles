# Dylan's Dotfiles

These are configuration files I use across a variety of environments including two Windows desktops (running Ubuntu within Windows) and two Ubuntu laptops. Do I still use Mac OS sometimes?

## Check the Wiki

This repo is very messy right now! [Check the wiki](https://github.com/dylan-k/dotfiles/wiki/Dylan's-Dotfiles-Wiki) for notes on how I have Ubuntu configured with i3 window manager, and other configs for a lean, mean writing machine..

Files Overview
--------------------------------------------------------------------------------

I don't use all of these but this list helps me to remember what different dotfiles are supposed to do.

`.config/` - config files for applications go here. For example, `.config/i3/` and `config/xfe/` store the configs for the i3 window manager and the xfe file explorer. 

`.fonts/` - user's installed fonts go here. All in one folder or using subdirectories, however you like.

`.bash_profile` Customizes the terminal

`.gitconfig` Global Git configuration to specify my name and email, shortcuts, colors, and more.

`.gitignore` Global git ignore list of files to exclude from git repositories

`.bashrc` - Gets run when bash is not a login prompt

`.bash_profile `- Gets run when bash is a login prompt

`.inputrc `- Configuration for everything that uses libreadline (including bash)

`.profile` - like .bash_profile, except works for any bourne shell, not just bash

`.xprofile` - no idea

`.xinitrc` - clients to run for startx command.

`.xinitrc` - runs when you use xinit either directly or through startx. Useful if you don't use a login, to run commands for window manager, etc.

`.xprofile` - is pretty much the same thing, but for the login manager.

`.inputrc` - configures readline, which a lot of things use, so that's where you put your global keyboard combos and data input preferences.

`.profile` - is supposed to be sourced by every shell that is run as a login shell. These days, with graphical environments and terminal multiplexers, this means almost every shell, but originally, this would only execute once per login,  PATH for example.
