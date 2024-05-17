#!/bin/bash
# Build script for engine
set -x
mkdir -p ../bin
# Get a list of all the .cpp files.
cppFilenames=$(find src -type f -name "*.cpp")
# echo "Files:" $cppFilenames
assembly="psyche"
compilerFlags="-g -shared -fdeclspec -fPIC"
# -fms-extensions
# -Wall -Werror
includeFlags="-Isrc -I$VULKAN_SDK/include -Ivendor/spdlog/include/"
linkerFlags="-lvulkan -lxcb -lX11 -lX11-xcb -lxkbcommon -L$VULKAN_SDK/lib -L/usr/X11R6/lib"
defines="-D_DEBUG -DPSC_BUILD_DLL"
echo "Building $assembly..."
clang++ $cppFilenames $compilerFlags -o ../bin/lib$assembly.so $defines $includeFlags $linkerFlags
