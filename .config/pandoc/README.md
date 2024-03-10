
Pandoc doesn't look for templates and filters here.
But this is where I store them, for version control
You can symlink from here to a place where pandoc expects
e.g.
ln -s /home/$USER/.config/pandoc $HOME/.local/share/pandoc
