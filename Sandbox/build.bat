@ECHO ON
REM Build script for sandbox

REM Create bin directory if it doesn't exist
IF NOT EXIST ../bin (
    mkdir ../bin
)

REM Get a list of all the .cpp files.
SET cppFilenames=
FOR /R src %%f in (*.cpp) do (
    SET cppFilenames=!cppFilenames! %%f
)

REM echo "Files:" %cppFilenames%

SET assembly=sandbox
SET compilerFlags=-g
REM -Wall -Werror
SET includeFlags=-Isrc -I../Psyche/src/ -I../Psyche/vendor/spdlog/include
SET linkerFlags=-L../bin/ -lpsyche -lstdc++
SET defines=-D_DEBUG -DPSC_IMPORT

ECHO "Building %assembly%..."
ECHO clang++ %cppFilenames% %compilerFlags% -o ../bin/%assembly% %defines% %includeFlags% %linkerFlags%
clang++ %cppFilenames% %compilerFlags% -o ../bin/%assembly% %defines% %includeFlags% %linkerFlags%
