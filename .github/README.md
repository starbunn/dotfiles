# ashley's dotfiles

my dotfiles. they change over time, like an adapting parasite.

these dotfiles are tracked in a bare git repository. this method has been described in [many](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html) [different](https://www.atlassian.com/git/tutorials/dotfiles) [ways](https://www.google.com/search?q=dotfiles+bare+git+repo).

## included:

- DE Config
- System Files
- Scripts
- Themes
- Program Configs
- Packages (TODO)

## DE Config

i use a tiling wm instead of a desktop environment. i'm not used to it yet, but i'm learning.

it's also let bloat and things are easier to tinker with.

⇒ [bspwm](https://github.com/baskerville/bspwm)

i use bspwm. i've tried many others (GNOME, KDE, AWESOMEWM, XMONAD, ETC.) but I liked bspwm the best.

⇒ [sxhkd](https://github.com/baskerville/sxhkd)

as a bspwm user, i obviously use sxhkd for managing keybinds.

⇒ [alacritty](https://github.com/alacritty/alacritty)

after not liking to have to deal with the kitty terminal, I have recently switched over to alacritty and am loving it.

⇒ [polybar](https://github.com/polybar/polybar)

i use polybar as my statusbar/workspace switcher.

⇒ [nitrogen](https://github.com/l3ib/nitrogen)

i use nitrogen to set my desktop wallpaper in xorg. it's lightweight and doesn't need *any* configuration, which is ***very*** nice

## System Files

you can find system files scattered around the place, but they can mostly be found in [.config/setup](https://github.com/noirelapine/dotfiles/blob/base/.config/setup)

## Scripts

all scripts i have made will be in [bin](https://github.com/noirelapine/dotfiles/blob/base/bin/)

## Program Configs
i think this one is self-explanatory. it contains VSCode, Discord, etc.

## Packages
i hope to be able to have a packages install script that installs every package i've installed with paru, on any arch system.

mostly for my own convenience.

## ashley's cheat sheet to install this shit

```bash
git clone --bare git@github.com:noirelapine/dotfiles.git ~/dotfiles.git
alias dots='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
dots checkout
dots submodule update --init --recursive
cd ~
./setup
```
