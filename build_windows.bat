@echo off
setlocal enabledelayedexpansion

echo ========================================
echo Qt CMake Build Configuration
echo ========================================
echo.

REM ====================================
REM QT CONFIGURATION
REM Edit this path to match your Qt installation
REM ====================================

set "QT_PATH=C:\Qt\6.9.3\mingw_64"

REM Other examples:
REM set "QT_PATH=C:\Qt\6.9.2\mingw_64"
REM set "QT_PATH=C:\Qt\6.8.1\mingw_64"

REM ====================================

REM Default build configuration
set "BUILD_TYPE=Release"
set "BUILD_DIR=build_windows"
set "EXE_NAME=indexer.exe"

REM Parse arguments
set RUN_AFTER_BUILD=0
set BUILD_ARGS=

for %%a in (%*) do (
if /I "%%a"=="debug" (
REM Use a separate directory for Debug builds
set "BUILD_TYPE=Debug"
set "BUILD_DIR=build_windows_debug"

```
) else if /I "%%a"=="release" (
    REM Explicitly select Release
    set "BUILD_TYPE=Release"
    set "BUILD_DIR=build_windows"

) else if /I "%%a"=="run" (
    REM Run the application after a successful build
    set RUN_AFTER_BUILD=1

) else (
    REM Pass unknown arguments to CMake
    set "BUILD_ARGS=!BUILD_ARGS! %%a"
)
```

)

REM Check Qt installation
if not exist "%QT_PATH%" (
echo ERROR: Qt path not found:
echo %QT_PATH%
echo.
echo Please edit QT_PATH in this script.
pause
exit /b 1
)

echo Qt Path: %QT_PATH%
echo Build Type: %BUILD_TYPE%
echo Build Directory: %BUILD_DIR%
echo.

REM Configure environment
set "CMAKE_PREFIX_PATH=%QT_PATH%"
set "PATH=%QT_PATH%\bin;%PATH%"

REM Add Qt tools if installed through Qt Maintenance Tool
set "QT_TOOLS_PATH=C:\Qt\Tools"

if exist "%QT_TOOLS_PATH%\Ninja" (
set "PATH=%QT_TOOLS_PATH%\Ninja;%PATH%"
)

if exist "%QT_TOOLS_PATH%\mingw1310_64\bin" (
set "PATH=%QT_TOOLS_PATH%\mingw1310_64\bin;%PATH%"
)

if exist "%QT_TOOLS_PATH%\CMake_64\bin" (
set "PATH=%QT_TOOLS_PATH%\CMake_64\bin;%PATH%"
)

echo Using Ninja generator
echo.
echo ========================================
echo Starting %BUILD_TYPE% build...
echo ========================================
echo.

if not exist "%BUILD_DIR%" (
mkdir "%BUILD_DIR%"
)

cd "%BUILD_DIR%"

echo Configuring CMake...
cmake -G Ninja ^
-DCMAKE_PREFIX_PATH="%QT_PATH%" ^
-DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
.. %BUILD_ARGS%

if errorlevel 1 (
echo.
echo ========================================
echo CMake configuration FAILED!
echo ========================================
cd ..
exit /b 1
)

echo.
echo Building...
cmake --build . --parallel

if errorlevel 1 (
echo.
echo ========================================
echo Build FAILED!
echo ========================================
cd ..
exit /b 1
)

echo.
echo Deploying Qt libraries...

if exist "%EXE_NAME%" (
windeployqt --qmldir .. "%EXE_NAME%"

```
if errorlevel 1 (
    echo WARNING: windeployqt reported an issue.
)
```

) else (
echo WARNING: %EXE_NAME% not found.
)

echo.
echo ========================================
echo %BUILD_TYPE% build completed successfully!
echo ========================================

REM Run application if requested
if %RUN_AFTER_BUILD%==1 (
echo.
echo ========================================
echo Running application...
echo ========================================
echo.

```
if exist "%EXE_NAME%" (
    "%EXE_NAME%"
    echo.
    echo Application exited with code %ERRORLEVEL%
) else (
    echo ERROR: %EXE_NAME% not found.
    cd ..
    exit /b 1
)
```

)

cd ..

echo.
endlocal
exit /b 0
