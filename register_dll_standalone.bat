@echo off
REM Set the title for the command prompt window
title Register DLL Utility (Standalone)

REM Prompt the user to enter the full path to the DLL file
set /p dll_path="Enter full path to DLL file: "

REM Check if the user actually entered a DLL path
if "%dll_path%"=="" (
    echo No DLL path entered. Exiting.
    pause
    exit /b 1
)

REM The regsvr32.exe command is used to register or unregister DLLs.
REM The /s switch stands for "Silent" mode, which means it won't display any dialog boxes.
echo.
echo Attempting to register: %dll_path%
regsvr32.exe /s "%dll_path%"

REM Check the ERRORLEVEL to determine if the registration was successful
if %ERRORLEVEL% == 0 (
    echo Operation completed: DLL registered successfully.
) else (
    echo Failed to register DLL: %dll_path%. Error code: %ERRORLEVEL%
)

REM Print a blank line for spacing
echo.

REM Pause so the user can see the output
pause
