@ECHO ON
REM Build script for engine

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

SET assembly=psyche
SET compilerFlags=-g -shared -Wvarargs -Wall -Werror
REM -Wall -Werror
SET includeFlags=-Isrc -I%VULKAN_SDK%/include -Ivendor/spdlog/include/
SET linkerFlags=-luser32 -lvulkan -L%VULKAN_SDK%/Lib
SET defines=-D_DEBUG -DPSC_BUILD_DLL

ECHO "Building %assembly%..."
ECHO clang++ %cppFilenames% %compilerFlags% -o ../bin/%assembly%.dll %defines% %includeFlags% %linkerFlags%
clang++ %cppFilenames% %compilerFlags% -o ../bin/%assembly%.dll %defines% %includeFlags% %linkerFlags%
