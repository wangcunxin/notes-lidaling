# git commands

## config

    git config --global core.editor "vim"

##common command

	git branch '$branch name'
    git checkout '$branch name'
    git checkout -b '$branch name'
    git remote update

- untrack files

		git rm --cached .DS_Store

## change git server ip

  git remote set-url origin git@192.168.0.26:ttyh/tools_py.git

## archive with uncommitted changes

make sure all uncommitted changes ref files is in git 

```
stashName=`git stash create`;
git archive <options> $stashName
```
