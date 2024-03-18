## Use fugitive to do code reviews

First, checkout the target branch:
`:Git checkout <branch>`

Then, bring up changes in quickfix:
`:Git difftool --name-status origin/dev`

Now, compare to dev:
`:Gvdiffsplit origin/dev`
