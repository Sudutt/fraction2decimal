@echo off
setlocal enabledelayedexpansion

set RAW_TEST_CASES_FILE="raw test cases.txt"

REM Get current date and time for unique filename
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%YYYY%%MM%%DD%_%HH%%Min%%Sec%"

REM Set output filename
set "output_file=results_%timestamp%_log.txt"

REM Compile the C++ program
echo Compiling bigmem.cpp...
g++ -o bigmem.exe bigmem.cpp
if errorlevel 1 (
    echo Compilation failed!
    pause
    exit /b 1
)

REM Create output file and write header
echo Test Results - %date% %time% > "%output_file%"
echo ========================================== >> "%output_file%"
echo. >> "%output_file%"

REM Read test cases from notes file
echo Running tests...
for /f "usebackq tokens=* delims=" %%i in (%RAW_TEST_CASES_FILE%) do (
    if not "%%i"=="" (
        echo Processing test case: %%i
        echo Test Case: %%i >> "%output_file%"
        echo Input: %%i >> "%output_file%"
        
        REM Parse numerator and denominator
        for /f "tokens=1,2 delims=/" %%a in ("%%i") do (
            set "num=%%a"
            set "den=%%b"
        )
        
        REM Run the program with the test case
        echo !num! !den! | bigmem.exe >> "%output_file%"
        echo. >> "%output_file%"
        echo ----------------------------------------- >> "%output_file%"
        echo. >> "%output_file%"
    )
)

echo.
echo Test results saved to: %output_file%
echo.
echo Contents of test results:
type "%output_file%"

echo.
echo Press any key to exit...
pause >nul
