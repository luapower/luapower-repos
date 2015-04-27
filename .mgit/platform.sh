#!/bin/bash
# detect current platform

[ "$PROCESSOR_ARCHITECTURE" = "AMD64" -o "$PROCESSOR_ARCHITEW6432" = "AMD64" ] && echo mingw64 || {
	[ "$OSTYPE" = "msys" ] && echo mingw32 || {
		a=32
		[ "$(uname -m)" = "x86_64" ] && a=64
		[ "${OSTYPE#darwin}" != "$OSTYPE" ] && echo osx$a || echo linux$a
	}
}
