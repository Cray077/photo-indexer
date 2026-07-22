param(
    [string]$QtAndroidPath = "C:\Qt\6.9.3\android_arm64_v8a", # Adjust this path to match your Qt installation
    [string]$Abi = "arm64-v8a",
    [string]$BuildType = "Release"
)

$ErrorActionPreference = "Stop"

Write-Host "==> Starting Qt Android Build" -ForegroundColor Cyan
Write-Host "Qt Path: $QtAndroidPath"
Write-Host "ABI: $Abi"
Write-Host "Build Type: $BuildType"

if (-not (Test-Path $QtAndroidPath)) {
    Write-Warning "The Qt Android path ($QtAndroidPath) was not found."
    Write-Warning "Please update the `$QtAndroidPath variable or pass it as an argument: .\build_android.ps1 -QtAndroidPath 'C:\path\to\qt'"
    exit 1
}

$BuildDir = "build_android"
if (-not (Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null
}

Set-Location $BuildDir

Write-Host "`n==> Configuring CMake..." -ForegroundColor Cyan
# Uses Qt's provided Android toolchain
cmake -G "Ninja" `
      -DCMAKE_TOOLCHAIN_FILE="$QtAndroidPath/lib/cmake/Qt6/qt.toolchain.cmake" `
      -DANDROID_ABI=$Abi `
      -DCMAKE_BUILD_TYPE=$BuildType `
      ..

if ($LASTEXITCODE -ne 0) {
    Write-Error "CMake configuration failed."
    exit 1
}

Write-Host "`n==> Building Shared Libraries (.so)..." -ForegroundColor Cyan
cmake --build . --parallel

if ($LASTEXITCODE -ne 0) {
    Write-Error "Library build failed."
    exit 1
}

Write-Host "`n==> Packaging APK..." -ForegroundColor Cyan
# For Qt 6, this target builds the APK via androiddeployqt
# The target name is based on your executable name: <target>_make_apk
cmake --build . --target appQtAndroidTemplate_make_apk

if ($LASTEXITCODE -ne 0) {
    Write-Error "APK packaging failed."
    exit 1
}

Write-Host "`n==> Build successful! Your APK should be in the $BuildDir/android-build/build/outputs/apk/ directory." -ForegroundColor Green
