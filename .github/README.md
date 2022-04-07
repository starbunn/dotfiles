# ashley's dotfiles

first generation of my dotfiles.

these dotfiles are tracked in a bare git repository. this method has been described in [many](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html) [different](https://www.atlassian.com/git/tutorials/dotfiles) [ways](https://www.google.com/search?q=dotfiles+bare+git+repo).

## ashley's cheat sheet

```bash
git clone --bare git@github.com:ashxi/dotfiles.git ~/dotfiles.git
alias dots='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
dots checkout
dots submodule update --init --recursive
```
