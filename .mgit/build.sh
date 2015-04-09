#!/bin/bash
# build packages and their dependencies in the right order.
# needs the `luapower` package to get the build order.

packages="$1"  # comma separated
platform="$2"

[ "$packages" ] || {
	echo "Usage: mgit build REPO,...|--all [platform]"
	exit 1
}

[ -f "luapower" ] || {
	echo "luapower package is needed to get the build order."
	echo "run `mgit clone luapower` to get it."
	exit 1
}

[ "$platform" ] || platform="$(./luapower platform)" || exit 1
packages="$(./luapower build-order $packages $platform)"

echo "Will build: ${packages//$'\n'/, }."
echo "Press any key to continue, Ctrl+C to quit."
read

for pkg in $packages do
    echo
    echo "-----------------------------------------------------------"
    echo
    echo "*** Building $pkg for $platform ***"
    echo
    csrc_dir="$(./luapower csrc-dir $pkg)"
    (cd "$csrc_dir" && ./build-$platform.sh)
done
