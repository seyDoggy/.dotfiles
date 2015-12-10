# My .dotfiles

Move on, nothing to see here... unless you use `ls -a`... haha, I made a shell joke.

I use this `bootstrap.shl` to get my environment up and running on Mac and Linux machines. Very handy when setting up new systems or spending a lot of time on a remote server. It's nice when everything feels like home.

Basic assumptions are that you use `zsh` and have it installed, that you have `curl`, `git` and `vim` installed. If you don't like anything that has been done, you can find your old .dotfiles in .dotfiles-old.

The `bootstrap.sh` script installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/), [spf-vim](http://vim.spf13.com/) and vim plugins, and then installs all my .dotfiles for vim and zsh.

There are a bunch of random shell scripts and configs in here too. There are all for linux, when certain things aren't installed already. Ignore them. They are for me because I am lazy and I had no other place to logically save them.

## Instructions
1. Read through the `bootstrap.sh` script to see and understand what is going to happen.
2. Run the `bootstrap.sh` script.
3. If running on a desktop environment, restart your computer (helps on Linux if running gnome).
