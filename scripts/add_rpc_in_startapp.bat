@echo off
setlocal

rem Определяем переменные
set SOURCE_FILE=settings.json
set DESTINATION_DIR=%systemdrive%%homepath%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

rem Проверяем, существует ли файл
if exist "%SOURCE_FILE%" (
    echo File %SOURCE_FILE% found.
    echo Moving a file to %DESTINATION_DIR%...

    rem Перемещаем файл
    move "%SOURCE_FILE%" "%DESTINATION_DIR%"

    echo The file has been moved to %DESTINATION_DIR%.
) else (
    echo File %SOURCE_FILE% not found.
)

echo.
echo Press any button...
pause > nul

endlocal
