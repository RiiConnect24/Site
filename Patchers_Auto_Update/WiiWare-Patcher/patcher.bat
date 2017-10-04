@echo off
set FilesHostedOn=https://kcrpl.github.io/Patchers_Auto_Update/WiiWare-Patcher
:1
cls
echo Hi. Please give us a few more moments. We are doing some changes.

powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WadInstaller.dll', 'WadInstaller.dll`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WiiwarePatcher.exe', 'WiiwarePatcher.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/lzx.exe', 'lzx.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/patcher.bat', 'patcher.bat`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/libWiiSharp.dll', 'libWiiSharp.dll`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/Sharpii.exe', 'Sharpii.exe`')"

if not exist WadInstaller.dll` goto error_update_not_available
if not exist WiiwarePatcher.exe` goto error_update_not_available
if not exist lzx.exe` goto error_update_not_available
if not exist patcher.bat` goto error_update_not_available
if not exist libWiiSharp.dll` goto error_update_not_available
if not exist Sharpii.exe` goto error_update_not_available

if exist WadInstaller.dll del WadInstaller.dll /q
if exist WiiwarePatcher.exe del WiiwarePatcher.exe /q
if exist lzx.exe del lzx.exe /q
if exist libWiiSharp.dll del libWiiSharp.dll /q
if exist Sharpii.exe del Sharpii.exe /q

ren WadInstaller.dll` WadInstaller.dll
ren WiiwarePatcher.exe` WiiwarePatcher.exe
ren lzx.exe` lzx.exe
ren libWiiSharp.dll` libWiiSharp.dll
ren Sharpii.exe` Sharpii.exe

echo ping localhost -n 2 >>temp.bat
echo del patcher.bat /q >>temp.bat
echo ren patcher.bat` patcher.bat >>temp.bat
echo start patcher.bat >>temp.bat
echo exit >>temp.bat
start temp.bat