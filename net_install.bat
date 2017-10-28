@echo off
cls
title RiiConnect24 IOS Patcher. Network Installer.
set last_build=2017/08/20
set at=20:00

set mode=120,30
mode %mode%

set FilesHostedOn=https://raw.githubusercontent.com/KcrPL/KcrPL.github.io/master/Patchers_Auto_Update/IOS_Patcher
set MainFolder=%appdata%\IOSPatcher
set TempStorage=%appdata%\IOSPatcher\internet\temp

if not exist %MainFolder% md %MainFolder%
if not exist %TempStorage% md %TempStorage%
goto 1
:1
cls
echo RiiConnect24 IOS Patcher. Network Installer - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Hi %username%, thanks for checking out RiiConnect24.
echo In order to download IOS Patcher, press any button.
echo.
echo (IOS Patcher will be saved on Desktop)
echo Press any button to continue.
pause>NUL
goto 2
:2
cls
echo RiiConnect24 IOS Patcher. Network Installer - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Please wait... (Checking version)
echo.
echo IOS Patcher.
echo Version: (Checking version)
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
echo -----------------------------------------------------------------------------------------------------------------------
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
echo RiiConnect24 IOS Patcher. Network Installer - (C) KcrPL (Compiled on %last_build% at %at%)
echo.
echo Please wait... (Downloading files)
echo.
echo IOS Patcher.
echo Version: %updateversion%

if not exist "C:\Users\%username%\Desktop\IOS-Patcher" md "C:\Users\%username%\Desktop\IOS-Patcher\"

powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/00000006-31.delta', '"C:\Users\%username%\Desktop\IOS-Patcher\00000006-31.delta`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/00000006-80.delta', '"C:\Users\%username%\Desktop\IOS-Patcher\00000006-80.delta`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WadInstaller.dll', '"C:\Users\%username%\Desktop\IOS-Patcher\WadInstaller.dll`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/libWiiSharp.dll', '"C:\Users\%username%\Desktop\IOS-Patcher\libWiiSharp.dll`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/wget.exe', '"C:\Users\%username%\Desktop\IOS-Patcher\wget.exe`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/xdelta3.exe', '"C:\Users\%username%\Desktop\IOS-Patcher\xdelta3.exe`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/Sharpii.exe', '"C:\Users\%username%\Desktop\IOS-Patcher\Sharpii.exe`"')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/patch.bat', '"C:\Users\%username%\Desktop\IOS-Patcher\patch.bat`"')"

:: If download failed
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\00000006-31.delta`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\00000006-80.delta`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\WadInstaller.dll`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\wget.exe`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\xdelta3.exe`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\Sharpii.exe`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\patch.bat`" goto error_update_not_available
if not exist "C:\Users\%username%\Desktop\IOS-Patcher\libWiiSharp.dll`" goto error_update_not_available

:: Delete the original files
if exist "C:\Users\%username%\Desktop\IOS-Patcher\00000006-31.delta" del "C:\Users\%username%\Desktop\IOS-Patcher\00000006-31.delta" /q
if exist "C:\Users\%username%\Desktop\IOS-Patcher\00000006-80.delta" del "C:\Users\%username%\Desktop\IOS-Patcher\00000006-80.delta" /q
if exist "C:\Users\%username%\Desktop\IOS-Patcher\WadInstaller.dll" del "C:\Users\%username%\Desktop\IOS-Patcher\WadInstaller.dll" /q
if exist "C:\Users\%username%\Desktop\IOS-Patcher\wget.exe" del "C:\Users\%username%\Desktop\IOS-Patcher\wget.exe" /q
if exist "C:\Users\%username%\Desktop\IOS-Patcher\xdelta3.exe" del "C:\Users\%username%\Desktop\IOS-Patcher\xdelta3.exe" /q
if exist "C:\Users\%username%\Desktop\IOS-Patcher\Sharpii.exe" del "C:\Users\%username%\Desktop\IOS-Patcher\Sharpii.exe" /q
if exist "C:\Users\%username%\Desktop\IOS-Patcher\libWiiSharp.dll" del "C:\Users\%username%\Desktop\IOS-Patcher\libWiiSharp.dll" /q

:: Renaming the temp files to original names
ren "C:\Users\%username%\Desktop\IOS-Patcher\00000006-31.delta`" "00000006-31.delta"
ren "C:\Users\%username%\Desktop\IOS-Patcher\00000006-80.delta`" "00000006-80.delta"
ren "C:\Users\%username%\Desktop\IOS-Patcher\WadInstaller.dll`" "WadInstaller.dll"
ren "C:\Users\%username%\Desktop\IOS-Patcher\wget.exe`" "wget.exe"
ren "C:\Users\%username%\Desktop\IOS-Patcher\xdelta3.exe`" "xdelta3.exe"
ren "C:\Users\%username%\Desktop\IOS-Patcher\Sharpii.exe`" "Sharpii.exe"
ren "C:\Users\%username%\Desktop\IOS-Patcher\libWiiSharp.dll`" "libWiiSharp.dll"
ren "C:\Users\%username%\Desktop\IOS-Patcher\patch.bat`" "patch.bat"
:: Running the script and exiting
start explorer.exe "C:\Users\%username%\Desktop\IOS-Patcher\"
exit
