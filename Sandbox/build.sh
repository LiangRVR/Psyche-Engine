#!/bin/bash
# Build script for sandbox
set -x
mkdir -p ../bin
# Get a list of all the .cpp files.
cppFilenames=$(find src -type f -name "*.cpp")
# echo "Files: " $cppFilenames
assembly="sandbox"
compilerFlags="-g -fdeclspec -fPIC"
# -fms-extensions
# -Wall -Werror
includeFlags="-Isrc -I../Psyche/src/ -I../Psyche/vendor/spdlog/include"
linkerFlags="-L../bin/ -lpsyche -lstdc++ -Wl,-rpath,."
defines="-D_DEBUG -DPSC_IMPORT"
echo "Building $assembly..."
echo clang++ $cppFilenames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags
clang++ $cppFilenames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags
