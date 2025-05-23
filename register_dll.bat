@echo off
REM Set the title for the command prompt window
title Register DLL Utility

REM Prompt the user to enter the full path to the DLL file
set /p dll_path="Enter full path to DLL file: "

REM Check if the Python script register_dll.py exists in the same directory
if not exist "register_dll.py" (
    echo Error: register_dll.py not found in the current directory.
    pause
    exit /b 1
)

REM Check if the user actually entered a DLL path
if "%dll_path%"=="" (
    echo No DLL path entered. Exiting.
    pause
    exit /b 1
)

REM Call the Python script register_dll.py with the entered DLL path
REM This assumes python.exe is in the PATH or python files are associated correctly.
echo.
echo Attempting to register: %dll_path%
python register_dll.py "%dll_path%"

REM Print a blank line for spacing
echo.

REM Pause so the user can see the output from the Python script
pause
