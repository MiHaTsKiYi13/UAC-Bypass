@echo off
:: Устанавливаем кодировку UTF-8 для корректного отображения символов
chcp 65001 >nul

:: Устанавливаем заголовок окна и стандартный цвет
title UAC Bypass Utility
color 0A

:main_menu
cls
call :display_banner

:: Просим ввести полный путь к файлу для запуска (или 'exit' для выхода)
color 0E
echo ───────────────────────────────────────────────────
echo  Enter the full path of the file to run (or type "exit" to quit):
echo ───────────────────────────────────────────────────
set /p "file_path=→ "

:: Если введено "exit", завершаем работу скрипта
if /I "%file_path%"=="exit" goto :exit_script

:: Проверяем, существует ли указанный файл
if not exist "%file_path%" (
    color 0C
    echo ───────────────────────────────────────────────────
    echo  [ERROR] File not found! Please try again.
    echo ───────────────────────────────────────────────────
    timeout /t 2 >nul
    goto :main_menu
)

:: Запускаем указанный файл без повышения привилегий (UAC bypass)
color 0B
echo ───────────────────────────────────────────────────
echo  Launching the file...
echo ───────────────────────────────────────────────────
timeout /t 1 >nul
cmd /min /C "set __COMPAT_LAYER=runasinvoker && start "" "%file_path%""

:: Выводим сообщение об успешном запуске
color 0A
echo ───────────────────────────────────────────────────
echo  [SUCCESS] Program started successfully!
echo ───────────────────────────────────────────────────
timeout /t 2 >nul
goto :main_menu

:: ------------------------------
:: Подпрограмма для отображения ASCII-баннера
:display_banner
echo.
echo.				▄• ▄▌ ▄▄▄·  ▄▄·     ▄▄▄▄·  ▄· ▄▌ ▄▄▄· ▄▄▄· .▄▄ · .▄▄ · 
echo.				█▪██▌▐█ ▀█ ▐█ ▌▪    ▐█ ▀█▪▐█▪██▌▐█ ▄█▐█ ▀█ ▐█ ▀. ▐█ ▀. 
echo.				█▌▐█▌▄█▀▀█ ██ ▄▄    ▐█▀▀█▄▐█▌▐█▪ ██▀·▄█▀▀█ ▄▀▀▀█▄▄▀▀▀█▄
echo.				▐█▄█▌▐█ ▪▐▌▐███▌    ██▄▪▐█ ▐█▀·.▐█▪·•▐█ ▪▐▌▐█▄▪▐█▐█▄▪▐█
echo.				 ▀▀▀  ▀  ▀ ·▀▀▀     ·▀▀▀▀   ▀ • .▀    ▀  ▀  ▀▀▀▀  ▀▀▀▀ 
echo.
exit /b

:: ------------------------------
:: Завершение работы скрипта
:exit_script
echo.
echo [INFO] Exiting the UAC Bypass Utility...
timeout /t 1 >nul
exit /b
