REM Build script for sandbox
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Create bin directory if it doesn't exist
IF NOT EXIST ../bin (
    mkdir ../bin
)

REM Get a list of all the .cpp files.
SET cppFilenames=
FOR /R %%f in (*.cpp) do (
    SET cppFilenames=!cppFilenames! %%f
)

REM echo "Files:" %cppFilenames%

SET assembly=sandbox
SET compilerFlags=-g -fdeclspec -fPIC
REM -Wall -Werror
SET includeFlags=-Isrc -I../Psyche/src/
SET linkerFlags=-L../bin/ -lpsyche -lstdc++ -Wl,-rpath,.
SET defines=-D_DEBUG -DPSC_IMPORT

ECHO "Building %assembly%..."
ECHO clang++ %cppFilenames% %compilerFlags% -o ../bin/%assembly% %defines% %includeFlags% %linkerFlags%
clang++ %cppFilenames% %compilerFlags% -o ../bin/%assembly% %defines% %includeFlags% %linkerFlags%
