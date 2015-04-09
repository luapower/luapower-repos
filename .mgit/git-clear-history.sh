# clear all the history of the current branch. use with caution!
local branch="$(git rev-parse --abbrev-ref HEAD)"
git checkout --orphan delete_me
git add -A
git commit -m "init (history cleared)"
git branch -D "$branch"
git branch -m "$branch"
