
# Stop and exit on error
set -e

# Setup compiler build flags
CC="em++"
CFLAGS="-O2 -std=c++14 --bind -lpthread -s DISABLE_EXCEPTION_CATCHING=0 -s WASM=1 -s USE_SDL=1 -s USE_SDL_IMAGE=1 -s STB_IMAGE=1 -s LEGACY_GL_EMULATION=1 -s GL_UNSAFE_OPTS=0"

# FIXME: If we didn't have to source emscripten sdk this way, we
# Could change to building with an incremental build system such
# as Cmake, Raise, or even a Makefile.
# Setup Emscripten/WebAssembly SDK
source ../emsdk/emsdk_env.sh



# Build the wasm file
echo Building WASM ...
$CC main.cpp $CFLAGS -o index.html

