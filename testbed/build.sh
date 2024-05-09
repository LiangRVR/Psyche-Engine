#!/bin/bash
# Build script for testbed
set -x
mkdir -p ../bin
# Get a list of all the .cpp files.
cppFilenames=$(find . -type f -name "*.cpp")
# echo "Files: " $cppFilenames
assembly="testbed"
compilerFlags="-g -fdeclspec -fPIC"
# -fms-extensions
# -Wall -Werror
includeFlags="-Isrc -I../engine/src/"
linkerFlags="-L../bin/ -lengine -lstdc++ -Wl,-rpath,."
defines="-D_DEBUG -DKIMPORT"
echo "Building $assembly..."
echo clang++ $cppFilenames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags
clang++ $cppFilenames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags
