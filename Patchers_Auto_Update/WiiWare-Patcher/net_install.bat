@echo off
cls
title Wiimmfi WiiWare Patcher. Network Installer.
set last_build=2017/08/25
set at=11:00

set mode=120,30
mode %mode%

set FilesHostedOn=https://rc24.xyz/Patchers_Auto_Update/WiiWare-Patcher
set MainFolder=%appdata%\WiiWare-Patcher
set TempStorage=%appdata%\WiiWare-Patcher\internet\temp

if not exist %MainFolder% md %MainFolder%
if not exist %TempStorage% md %TempStorage%
goto 1
:1
cls
echo Wiimmfi WiiWare Patcher. Network Installer. - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Hi %username%, thanks for checking out RiiConnect24.
echo In order to download WiiWare Patcher, press any button.
echo.
echo (WiiWare Patcher will be saved on Desktop)
echo Press any button to continue.
pause>NUL
goto 2
:2
cls
echo Wiimmfi WiiWare Patcher. Network Installer. - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Please wait... (Checking version)
echo.
echo WiiWare Patcher.
echo Version: (Checking version)
if exist %TempStorage%/version.txt del /q %TempStorage%/version.txt
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/version.txt', '%TempStorage%/version.txt')"  
	set /a temperrorlev=%errorlevel%
	
	::Bind error codes to errors here
	if not %errorlevel%==0 goto error_update_not_available
	
if exist %TempStorage%\version.txt set /p updateversion=<%TempStorage%\version.txt
goto 3
:error_update_not_available
cls
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo -----------------------------------------------------------------------------------------------------------------------
echo    /---\   Error.              
echo   /     \  An Update server is not available.
echo  /   !   \ 
echo  ---------  
echo.            
echo            Press any button to continue.
echo-----------------------------------------------------------------------------------------------------------------------
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
pause>NUL
goto 1
:3
cls
echo Wiimmfi WiiWare Patcher. Network Installer. - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Please wait... (Downloading files)
echo.
echo WiiWare Patcher.
echo Version: %updateversion%

if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher" md "C:\Users\%username%\Desktop\WiiWare-Patcher\"
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher" goto 3

if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll`" /q 2> nul
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\WiiwarePatcher.exe`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\wget.exe`" /q 2> nul
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\lzx.exe`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\xdelta3.exe`" 2> nul
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat`" /q 2> nul
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll`" /q 2> nul
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe`" del "C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe`" /q 2> nul

powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WadInstaller.dll', '"C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WiiwarePatcher.exe', '"C:\Users\%username%\Desktop\WiiWare-Patcher\WiiwarePatcher.exe`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/lzx.exe', '"C:\Users\%username%\Desktop\WiiWare-Patcher\lzx.exe`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/patcher.bat', '"C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/libWiiSharp.dll', '"C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/Sharpii.exe', '"C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe`"')"

if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher\WiiwarePatcher.exe`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher\lzx.exe`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe`" goto error_update_not_available

if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll" del "C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll" /q
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\WiiwarePatcher.exe" del "C:\Users\%username%\Desktop\WiiWare-Patcher\WiiwarePatcher.exe" /q
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\lzx.exe" del "C:\Users\%username%\Desktop\WiiWare-Patcher\lzx.exe" /q
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll" del "C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll" /q
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe" del "C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe" /q
if exist "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat" del "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat" /q

ren "C:\Users\%username%\Desktop\WiiWare-Patcher\WadInstaller.dll`" "WadInstaller.dll"
ren "C:\Users\%username%\Desktop\WiiWare-Patcher\WiiwarePatcher.exe`" "WiiwarePatcher.exe"
ren "C:\Users\%username%\Desktop\WiiWare-Patcher\lzx.exe`" "lzx.exe"
ren "C:\Users\%username%\Desktop\WiiWare-Patcher\libWiiSharp.dll`" "libWiiSharp.dll"
ren "C:\Users\%username%\Desktop\WiiWare-Patcher\Sharpii.exe`" "Sharpii.exe"
ren "C:\Users\%username%\Desktop\WiiWare-Patcher\patcher.bat`" "patcher.bat

:: Running the script and exiting
start explorer.exe "C:\Users\%username%\Desktop\WiiWare-Patcher\"
exit