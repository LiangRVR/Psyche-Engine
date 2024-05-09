REM Build script for engine
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .cpp files.
SET cppFilenames=
FOR /R %%f in (*.cpp) do (
    SET cppFilenames=!cppFilenames! %%f
)

REM echo "Files:" %cppFilenames%

SET assembly=engine
SET compilerFlags=-g -shared -Wvarargs -Wall -Werror -std=c++11
REM -Wall -Werror
SET includeFlags=-Isrc -I%VULKAN_SDK%/Include
SET linkerFlags=-luser32 -lvulkan-1 -L%VULKAN_SDK%/Lib
SET defines=-D_DEBUG -DKEXPORT -D_CRT_SECURE_NO_WARNINGS

ECHO "Building %assembly%%..."
g++ %cppFilenames% %compilerFlags% -o ../bin/%assembly%.dll %defines% %includeFlags% %linkerFlags%
