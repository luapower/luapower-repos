# increment the current tag (assuming it's a number) and push tags
# TODO: make this more robust by checking and incrementing the first number _inside any string_.
local tag="$(git describe --tags --abbrev=0 2>/dev/null)"
[ "$tag" ] || tag="0"
local n=$((tag+0))
[ "$n" == "$tag" ] || usage "Tag '$tag' is not a number."
tag=$((tag+1))
git tag -f "$tag"
git push -f --tags
