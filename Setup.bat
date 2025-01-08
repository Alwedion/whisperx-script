@echo off
REM Navigate to the folder containing this script
cd /d "%~dp0"

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed or not in PATH. Exiting.
    pause
    exit /b
)

REM Check if the virtual environment already exists
if not exist "whisperx\Scripts\activate.bat" (
    echo Creating virtual environment 'whisperx'...
    python -m venv whisperx
    if %errorlevel% neq 0 (
        echo Failed to create virtual environment. Exiting.
        pause
        exit /b
    )
    echo Virtual environment 'whisperx' created successfully.
) else (
    echo Virtual environment 'whisperx' already exists.
)

REM Activate the virtual environment
echo Activating virtual environment 'whisperx'...
call whisperx\Scripts\activate.bat

REM Install dependencies from requirements.txt
if exist "requirements.txt" (
    echo Installing packages from requirements.txt...
    pip install --upgrade pip
    pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo Failed to install packages from requirements.txt. Exiting.
        pause
        exit /b
    )
    echo Packages installed successfully.
) else (
    echo requirements.txt not found. Skipping package installation.
)

REM Keep the terminal open after execution
pause
