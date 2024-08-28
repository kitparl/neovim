# my-dotfiles

## Setup
```sh
git init --bare $HOME/.my-dotfiles
alias mydotfiles='git --git-dir=$HOME/.my-dotfiles/ --work-tree=$HOME'
mydotfiles remote add origin git@github.com:Siilwyn/my-dotfiles.git
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.my-dotfiles https://github.com/Siilwyn/my-dotfiles.git my-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' my-dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Configuration
```sh
mydotfiles config status.showUntrackedFiles no
mydotfiles remote set-url origin git@github.com:Siilwyn/my-dotfiles.git
```

## Usage
```sh
mydotfiles status
mydotfiles add .gitconfig
mydotfiles commit -m 'Add gitconfig'
mydotfiles push
```

### Bare config file is similar to

```
[core]
	repositoryformatversion = 0
	filemode = true
	bare = true
[status]
	showUntrackedFiles = no
[remote "origin"]
	url = git@github.com:kitparl/neovim.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[advice]
	addIgnoredFile = false
```
