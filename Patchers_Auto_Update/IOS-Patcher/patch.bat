@echo off
set FilesHostedOn=https://kcrpl.github.io/Patchers_Auto_Update/IOS_Patcher
:1
cls
echo Hi. Please give us a few more moments. We are doing some changes.

if exist 00000006-31.delta` del 00000006-31.delta` /q 2> nul
if exist 00000006-80.delta` del 00000006-80.delta` /q 2> nul
if exist WadInstaller.dll` del WadInstaller.dll` /q 2> nul
if exist wget.exe` del wget.exe` /q 2> nul
if exist xdelta3.exe` del xdelta3.exe` 2> nul
if exist patch.bat` del patch.bat` /q 2> nul
if exist libWiiSharp.dll` del  libWiiSharp.dll` /q 2> nul
if exist Sharpii.exe` del Sharpii.exe` /q 2> nul

:: Downloading the update files. 
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/00000006-31.delta', '00000006-31.delta`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/00000006-80.delta', '00000006-80.delta`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WadInstaller.dll', 'WadInstaller.dll`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/libWiiSharp.dll', 'libWiiSharp.dll`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/wget.exe', 'wget.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/xdelta3.exe', 'xdelta3.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/Sharpii.exe', 'Sharpii.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/patch.bat', 'patch.bat`')"

:: Delete the original files
if exist 00000006-31.delta del 00000006-31.delta /q
if exist 00000006-80.delta del 00000006-80.delta /q
if exist WadInstaller.dll del WadInstaller.dll /q
if exist wget.exe del wget.exe /q
if exist xdelta3.exe del xdelta3.exe /q
if exist Sharpii.exe del Sharpii.exe /q
if exist libWiiSharp.dll del libWiiSharp.dll /q

:: Renaming the temp files to original names
ren 00000006-31.delta` 00000006-31.delta
ren 00000006-80.delta` 00000006-80.delta
ren WadInstaller.dll` WadInstaller.dll
ren wget.exe` wget.exe
ren xdelta3.exe` xdelta3.exe
ren Sharpii.exe` Sharpii.exe
ren libWiiSharp.dll` libWiiSharp.dll

:: Patch.bat cannot be overwritten while running so i'm creating a small script
echo ping localhost -n 2 >>temp.bat
echo del patch.bat /q >>temp.bat
echo ren patch.bat` patch.bat >>temp.bat
echo start patch.bat >>temp.bat
echo exit >>temp.bat
:: Running the script and exiting patch.bat
start temp.bat
exit	