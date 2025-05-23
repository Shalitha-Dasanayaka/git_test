@echo off
REM Set the title for the command prompt window
title Register Multiple DLLs Utility (Standalone)

REM Prompt the user to enter the path to the folder containing DLL files
set /p folder_path="Enter the path to the folder containing DLL files: "

REM Check if the user actually entered a folder path
if "%folder_path%"=="" (
    echo No folder path entered. Exiting.
    pause
    exit /b 1
)

REM Check if the folder exists
if not exist "%folder_path%" (
    echo Folder not found: %folder_path%
    pause
    exit /b 1
)

REM The regsvr32.exe command is used to register or unregister DLLs.
REM The /s switch stands for "Silent" mode, which means it won't display any dialog boxes.
echo.
echo Attempting to register DLLs from folder: %folder_path%
echo.

REM Loop through all .dll files in the specified folder
FOR %%f IN ("%folder_path%\*.dll") DO (
    echo Processing: %%f
    regsvr32.exe /s "%%f"
    
    REM Check the ERRORLEVEL to determine if the registration was successful for the current file
    if %ERRORLEVEL% == 0 (
        echo   SUCCESS: %%f registered successfully.
    ) else (
        echo   FAILED: %%f could not be registered. Error code: %ERRORLEVEL%
    )
    echo.
)

REM Print a blank line for overall spacing at the end if needed, or remove if too much.
REM echo.

REM Pause so the user can see the output
pause
