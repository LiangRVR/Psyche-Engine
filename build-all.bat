@ECHO ON
REM Build script for rebuilding everything

ECHO "Building everything..."

PUSHD Psyche
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (
    echo Error:%ERRORLEVEL% && exit /b
)

PUSHD Sandbox
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (
    echo Error:%ERRORLEVEL% && exit /b
)

ECHO "All assemblies built successfully."
