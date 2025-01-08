@echo off
REM Navigate to the folder containing this script
cd /d "%~dp0"

REM Check if the virtual environment is activated
if "%VIRTUAL_ENV%"=="" (
    echo Virtual environment is not activated. Activating 'whisperx'...
    if not exist "whisperx\Scripts\activate.bat" (
        echo Virtual environment 'whisperx' not found. Please run Setup.bat first.
        pause
        exit /b
    )
    call whisperx\Scripts\activate.bat >nul 2>&1
)

REM Run subtitular.py using the virtual environment
if exist "subtitular.py" (
    echo Running subtitular.py...
    python subtitular.py > subtitular_log.txt 2>&1
    if %errorlevel% neq 0 (
        echo Failed to execute subtitular.py. Check subtitular_log.txt for details.
        pause
        exit /b
    )
    echo subtitular.py executed successfully.
) else (
    echo subtitular.py not found in the current directory. Exiting.
    pause
    exit /b
)

REM Keep the terminal open after execution
pause
