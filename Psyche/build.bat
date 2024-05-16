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

SET assembly=psyche
SET compilerFlags=-g -shared -fdeclspec -fPIC
SET includeFlags=-Isrc -I%VULKAN_SDK%/Include
SET linkerFlags=-lvulkan -lxcb -lX11 -lX11-xcb -lxkbcommon -L%VULKAN_SDK%/Lib -L/usr/X11R6/lib
SET defines=-D_DEBUG -DPSC_BUILD_DLL

ECHO "Building %assembly%..."
clang++ %cppFilenames% %compilerFlags% -o ../bin/lib%assembly%.so %defines% %includeFlags% %linkerFlags%
