@echo off
:: The version variable - it's being used to check for update and just to show user what version is user using.
set version=1.7.8
if exist temp.bat del /q temp.bat
if exist "C:\Users\%username%\Desktop\IOSPatcherDebug.txt" goto debug_load
:1
set /a copyingsdcard=0
set /a translationsserror=0
:: Window size (Lines, columns)
mode 126,35
:: Coding page
chcp 65001
set error4112=0
set filcheck=0
set patchingok=1
:: Window Title
title IOS Patcher for RiiConnect24 v.%version%  Created by @Larsenv, @KcrPL
set last_build=2017/08/07
set at=12:52
:: ### Auto Update ###
:: 1=Enable 0=Disable
:: IOSPatcher_Update_Activate - If disabled, patcher will not even check for updates, default=1
:: offlinestorage - Only used while testing of Update function, default=0
:: FilesHostedOn - The website and path to where the files are hosted. WARNING! DON'T END WITH "/"
:: MainFolder/TempStorage - folder that is used to keep version.txt and whatsnew.txt. These two files are deleted every startup but if offlinestorage will be set 1, they won't be deleted.
set /a IOSPatcher_Update_Activate=1
set /a offlinestorage=0
set FilesHostedOn=https://rc24.xyz/Patchers_Auto_Update/IOS-Patcher
set MainFolder=%appdata%\IOSPatcher
set TempStorage=%appdata%\IOSPatcher\internet\temp

:: Trying to prevent running from OS that is not Windows.
if %os%=="" goto not_windows_nt
if not %os%==Windows_NT goto not_windows_nt

set /a versioncheck=0
:: If program is opened as an admin the path will messed up
if not exist patch.bat goto admin_error
goto begin_main
:not_windows_nt
cls
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
echo.
echo Please don't run our IOS Patcher in MS-DOS :P.
echo Run it only on Windows Vista+ computer. :)
pause>NUL
exit
:admin_error
cls
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
echo.
echo ERROR.
echo An error has been occurred. Please try to run this program without ADMIN privileges (or change this batch file name to patch.bat)
pause>NUL
goto admin_error
:begin_main
mode 126,35
cls
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd               
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+    RiiConnect your Wii.       
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN   Press any button to begin                 
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
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
goto startup_script
:startup_script
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
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
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
echo                                                                        Please wait...
:: We don't support Windows XP anymore. Windows XP don't have timeout command, it means that if that command will be runned on Windows XP it will return exit code 1. 
set /a errorwinxp=0
timeout -0 /nobreak >NUL || set /a errorwinxp=1
if %errorwinxp%==1 goto winxp_notice

:: Update script.
set updateversion=0.0.0
:: Delete version.txt and whatsnew.txt
if %offlinestorage%==0 if exist %TempStorage%\version.txt del %TempStorage%\version.txt /q
if %offlinestorage%==0 if exist %TempStorage%\version.txt` del %TempStorage%\version.txt` /q
if %offlinestorage%==0 if exist %TempStorage%\whatsnew.txt del %TempStorage%\whatsnew.txt /q
if %offlinestorage%==0 if exist %TempStorage%\whatsnew.txt` del %TempStorage%\whatsnew.txt` /q

if not exist %TempStorage% md %TempStorage%
:: Commands to download files from server.
if %IOSPatcher_Update_Activate%==1 if %offlinestorage%==0 powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/whatsnew.txt', '%TempStorage%/whatsnew.txt')"
if %IOSPatcher_Update_Activate%==1 if %offlinestorage%==0 powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/version.txt', '%TempStorage%/version.txt')"

	set /a temperrorlev=%errorlevel%
	
	::Bind error codes to errors here
	if not %errorlevel%==0 goto error_update_not_available
	

if exist "%TempStorage%\version.txt`" ren "%TempStorage%\version.txt`" "version.txt"
if exist "%TempStorage%\whatsnew.txt`" ren "%TempStorage%\whatsnew.txt`" "whatsnew.txt"
:: Copy the content of version.txt to variable.
if exist %TempStorage%\version.txt set /p updateversion=<%TempStorage%\version.txt
if not exist %TempStorage%\version.txt set /a updateavailable=0
if %IOSPatcher_Update_Activate%==1 if exist %TempStorage%\version.txt set /a updateavailable=1
:: If version.txt doesn't match the version variable stored in this batch file, it means that update is available.
if %updateversion%==%version% set /a updateavailable=0 

if %IOSPatcher_Update_Activate%==1 if %updateavailable%==1 goto update_notice
	
:startup_script_files_check
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
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
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
echo                                                                        Please wait...
:: Important check for files. We need them to patch IOS's
if not exist 00000006-80.delta goto error_runtime_error
if not exist 00000006-31.delta goto error_runtime_error
if not exist libWiiSharp.dll goto error_runtime_error
if not exist Sharpii.exe goto error_runtime_error
if not exist WadInstaller.dll goto error_runtime_error
if not exist wget.exe goto error_runtime_error
if not exist xdelta3.exe goto error_runtime_error
set filcheck=1

goto main_fade_out
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
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   Error.              
echo   /     \  An Update server is not available.
echo  /   !   \ 
echo  ---------  
echo.            
echo            Press any button to continue.
echo ------------------------------------------------------------------------------------------------------------------------------    
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
goto begin_main
:update_notice
if %updateversion%==0.0.0 goto error_update_not_available
set /a update=1
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
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   An Update is available.              
echo   /     \  An Update for this program is available. We suggest updating the IOS Patcher to the latest version.
echo  /   !   \ 
echo  ---------  Current version: %version%
echo             New version: %updateversion%
echo                       1. Update                      2. Dismiss               3. What's new in this update?
echo ------------------------------------------------------------------------------------------------------------------------------    
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
set /p s=
if %s%==1 goto update_files
if %s%==2 goto begin_main
if %s%==3 goto whatsnew
goto update_notice
:update_files
cls
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
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   Updating.
echo   /     \  Please wait...
echo  /   !   \ 
echo  --------- IOS Patcher will restart shortly... 
echo.             
echo.
echo ------------------------------------------------------------------------------------------------------------------------------    
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
:: Deleting the temp files if they exist.
if exist 00000006-31.delta` del 00000006-31.delta` /q 2> nul
if exist 00000006-80.delta` del 00000006-80.delta` /q 2> nul
if exist WadInstaller.dll` del WadInstaller.dll` /q 2> nul
if exist wget.exe` del wget.exe` /q 2> nul
if exist xdelta3.exe` del xdelta3.exe` 2> nul
if exist patch.bat` del patch.bat` /q 2> nul
if exist libWiiSharp.dll` del  libWiiSharp.dll` /q 2> nul
if exist Sharpii.exe` del Sharpii.exe` /q 2> nul

:: Downloading the update files. In future i'm gonna add something called "Files Version" (at least i call it that way). Because most of the time the patch.bat is only updated
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/00000006-31.delta', '00000006-31.delta`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/00000006-80.delta', '00000006-80.delta`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/WadInstaller.dll', 'WadInstaller.dll`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/libWiiSharp.dll', 'libWiiSharp.dll`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/wget.exe', 'wget.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/xdelta3.exe', 'xdelta3.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/Sharpii.exe', 'Sharpii.exe`')"
powershell -command "(new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/patch.bat', 'patch.bat`')"

:: If download failed
if %update%==1 if not exist 00000006-31.delta` goto error_update_not_available
if %update%==1 if not exist 00000006-80.delta` goto error_update_not_available
if %update%==1 if not exist WadInstaller.dll` goto error_update_not_available
if %update%==1 if not exist wget.exe` goto error_update_not_available
if %update%==1 if not exist xdelta3.exe` goto error_update_not_available
if %update%==1 if not exist Sharpii.exe` goto error_update_not_available
if %update%==1 if not exist patch.bat` goto error_update_not_available
if %update%==1 if not exist libWiiSharp.dll` goto error_update_not_available

:: Delete the original files
if %update%==1 if exist 00000006-31.delta del 00000006-31.delta /q
if %update%==1 if exist 00000006-80.delta del 00000006-80.delta /q
if %update%==1 if exist WadInstaller.dll del WadInstaller.dll /q
if %update%==1 if exist wget.exe del wget.exe /q
if %update%==1 if exist xdelta3.exe del xdelta3.exe /q
if %update%==1 if exist Sharpii.exe del Sharpii.exe /q
if %update%==1 if exist libWiiSharp.dll del libWiiSharp.dll /q

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
exit
exit
:whatsnew
cls
if not exist %TempStorage%\whatsnew.txt goto whatsnew_notexist
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------              
echo.
echo What's new in update %updateversion%?
echo.
type %TempStorage%\whatsnew.txt
pause>NUL
goto update_notice
:whatsnew_notexist
cls
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
echo -----------------------------------------------------------------------------------------------------------------------------              
echo.
echo Error. What's new file is not available.
echo.
echo Press any button to go back.
pause>NUL
goto update_notice
:winxp_notice
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
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   Windows XP Support Ended.              
echo   /     \  Thanks for using the program but support for any system older than Windows 7 has been ended.
echo  /   !   \ It means that you can still use this program but if you encounter any problem with it we will not help you.
echo  --------- We may release ESR if needed. (Extended Support Release)             
echo.
echo            Press any key to continue.
echo ------------------------------------------------------------------------------------------------------------------------------    
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
goto main_fade_out
:main_fade_out
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
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
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
echo. 
ping localhost -n 3 >NUL
goto set_language_en
:error_runtime_error
set /a update=0
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
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   ERROR.              
echo   /     \  Some files needed to run this program weren't found.
echo  /   !   \ Press any button to download these files.
echo  ---------              
echo ------------------------------------------------------------------------------------------------------------------------------    
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
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
goto update_files
:error_code_error
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
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   ERROR.              
echo   /     \  Translation file is broken or file check has failed...
echo  /   !   \ 
echo  --------- Press any button to go back.             
echo ------------------------------------------------------------------------------------------------------------------------------    
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
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
goto begin_main
:begin
cls
if exist "%appdata%\temprc24.txt" del /q "%appdata%\temprc24.txt"
if %language%==NotDefined goto set_language
if not exist 00000006-80.delta set /a delta80=2
if not exist 00000006-31.delta set /a delta31=2
if not exist libWiiSharp.dll goto error_runtime_error
if not exist Sharpii.exe goto error_runtime_error
if not exist WadInstaller.dll goto error_runtime_error
if not exist wget.exe goto error_runtime_error
if not exist xdelta3.exe goto error_runtime_error
set filcheck=1
goto 3
:debug_load
cls
@echo off
cls

:debug_1
:: Debug menu
if not defined %output% set output=No output.
cls
echo IOS Patcher for RiiConnect24 Larsenv, KcrPL
echo debug menu
echo.
echo Output:
echo %output%
echo.
echo 1. Check for runtime files
echo 2. Check system req
echo 3. Load a translation into memory
echo 4. Exit debug menu
echo 5. Exit.
echo 6. Run patching script
echo 7. Delete files/Refresh program.
echo 8. Change coding page to cmd defualt
echo 9. Change coding page to 65001 (UTF-8)
echo 10. Open command prompt
set /p s=Choose:
if %s%==1 goto debug_runtime
if %s%==2 goto debug_system_Req
if %s%==3 goto set_language
if %s%==4 goto begin
if %s%==5 exit
if %s%==6 goto debug_download
if %s%==7 goto refresh_database
if %s%==8 goto debug_coding_8
if %s%==9 goto debug_coding_utf
if %s%==10 cmd.exe

goto debug_1
:debug_runtime
set /a tempvariable=0
if not exist 00000006-31.delta set /a tempvariable=1
if not exist 00000006-80.delta set /a tempvariable=1
if not exist libWiiSharp.dll set /a tempvariable=1
if not exist Sharpii.exe set /a tempvariable=1
if not exist WadInstaller.dll set /a tempvariable=1
if not exist wget.exe set /a tempvariable=1
if not exist xdelta3.exe set /a tempvariable=1

if %tempvariable%==1 set output=Files are corrupted. Please download a new package from GitHub or unpack this program!
if %tempvariable%==0 set output=It seems that the files are OK!
goto debug_1
:debug_system_Req
set /a tempvariable=0
timeout 1 /nobreak || set /a tempvariable=1 >NUL

if %tempvariable%==0 set output=There should be no problems with this program.
if %tempvariable%==1 set output=Your OS is probably Windows XP. You may experience some problems with this program.
goto debug_1
:refresh_database
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Deleting files.
echo.
echo You are about to delete any temporary files that have been created by this Patcher.
echo.
echo Is that OK?
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo                          1. Yes                                                 2. No
set /p s=
if %s%==1 goto debug_ref
if %s%==2 goto debug_1
goto refresh_database
:debug_ref
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Deleting files.
echo.
del /q IOS31-old.wad >NUL
del /q IOS80-old.wad >NUL
del /q IOS31\00000006.app >NUL
rmdir /q /s IOS31 >NUL
rmdir /q /s IOS80 >NUL
del /q 00000006.app >NUL
del /q IOS80\00000006.app >NUL

set output=OK!
echo Files has been deleted.
echo This program will restart shortly.
ping localhost -n 5 >NUL
goto 1
:debug_coding_8
chcp 852
set output=Coding page change was successful.
goto debug_1
:debug_coding_utf
chcp 65001
set output=Coding page change was successful.
goto debug_1
:debug_download
cls
echo Downloading IOS 31...
Sharpii.exe NUSD -ios 31 -v latest -o IOS31-old.wad -wad >NUL
echo Downloading IOS 80...
Sharpii.exe NUSD -ios 80 -v latest -o IOS80-old.wad -wad >NUL
set output=Downloading successfull.
goto debug_download1
:debug_download1
echo Do you want to patch IOS 31 and 80 for RiiConnect?
echo 1. Yes
echo 2. No
set /p s=Choose:
if %s%==1 goto debug_download_patch
if %s%==2 goto debug_1
goto debug_download_1
:debug_download_patch
Sharpii.exe WAD -u IOS31-old.wad IOS31/ >NUL
Sharpii.exe WAD -u IOS80-old.wad IOS80/ >NUL
move IOS31\00000006.app 00000006.app >NUL
xdelta3.exe -f -d -s 00000006.app 00000006-31.delta IOS31\00000006.app >NUL
move IOS80\00000006.app 00000006.app >NUL
xdelta3.exe -f -d -s 00000006.app 00000006-80.delta IOS80\00000006.app >NUL
mkdir WAD
Sharpii.exe WAD -p IOS31\ WAD\IOS31.wad -fs >NUL
Sharpii.exe WAD -p IOS80\ WAD\IOS80.wad -fs >NUL
del 00000006.app /q >NUL
del IOS31-old.wad /q >NUL
del IOS80-old.wad /q >NUL
rmdir /s /q IOS31 >NUL
rmdir /s /q IOS80 >NUL
Sharpii.exe IOS WAD\IOS31.wad -fs -es -np -vp
Sharpii.exe IOS WAD\IOS80.wad -fs -es -np -vp
set output=Patching and downloading IOS 31, 80 done.
goto debug_1





:set_language
set translationsserror=0
mode 126,35
set s=NUL
rem ### Please do not make any changes to this part of code. ###
rem # Please contact me on Discord - KcrPL#4625 ###
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL. v%version%
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Please select your language
echo.
echo.
echo Notice from creator of this patcher.
echo.
echo I don't know how you got here (probably from debug menu).
echo If from debug menu, congratulation :P.
echo.
echo It was very fun to create this section of the program but it's time to delete it.
echo If you were using it, I'm sorry. Over 50% of every language were not translated.
echo Thanks to:
echo  TimNook for Deutsch translation, iDroid for French translation, GameCube for Italian translation,
echo   Artuto for Spanish translation, prosuWANTED for Russian translation and Fun4TubeGr for Greek translation.
echo.
echo                                                                                            Thanks for understanding.
echo                                                                                                              -KcrPL.
echo.
echo Press anything to go back to main menu.
goto begin_main

:set_language_en
cls
set text1=Some of the files needed to run this program were not found.
set text2=Redownload the package and try again.
set text3=Click any button to close the patcher.
set text4=Are you gonna be using this patcher for Wii or WiiU?
set text5=Unfortunately, you cannot use this patcher for Wii U :(
set text6=If you were joking, click something to go back.
set text7=If not, close this program.
set text8=We need to download IOS 31 and 80.
set text9=Click any button to proceed to download.
set text10=We cannot download the files because your Internet connection is disabled!
set text11=Enable your connection and click any button to try again.
set text12=Please wait... files are being downloaded...
set text13=Patching is done.
set text14=Patched IOS files will be in folder called "WAD".
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copied to SD Card to folder called "WAD"

set language=English
goto begin

:DoNotTouchThisSection
set error4112=1
goto error4112
:error_code_error
mode 126,35
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Error.
echo.
echo ERROR.
echo It seems that error has occurred.
echo.
echo It's because this translation is broken. Or file check has failed.
pause>NULc
goto error_code_error

:error_translation_not_completed
mode 126,35
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Error.
echo.
echo It seems that the translation that you've chosen is broken/not completed.
echo Missing strings of translation will be now replaced with english strings.
echo.
echo Press any button to continue.
pause>NUL
set /a translationsserror=1
goto begin
:3
mode 126,35
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Configuring
echo.
echo %text4%
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo                          1. Wii                                                 2. WiiU
set /p s=Choose:
if %s%==1 goto 4
if %s%==2 goto error_3
goto 3
:error_3
mode 126,35
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Error.
echo.
echo %text5%
echo.
echo %text6%
echo %text7%
pause>NUL
goto 3
:4
mode 126,35
set instalorder=1
set intrepeat=0
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Info.
echo.
echo %text8%
echo %text9%
echo.
pause>NUL
goto 5

:5
mode 126,35	
set modul=NOT DEFINED
if exist WAD rmdir WAD /s /q
cls
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :          : 0%%
rem ### Patching ###
call Sharpii.exe NUSD -ios 31 -v latest -o IOS31-old.wad -wad >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching


cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :--        : 20%%
call Sharpii.exe NUSD -ios 80 -v latest -o IOS80-old.wad -wad >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :----      : 40%%
call Sharpii.exe WAD -u IOS31-old.wad IOS31/ >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

call Sharpii.exe WAD -u IOS80-old.wad IOS80/ >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

move IOS31\00000006.app 00000006.app >NUL
set /a temperrorlev=%errorlevel%
set modul=move.exe
if not %temperrorlev%==0 goto error_patching

cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :-----     : 50%%
call xdelta3.exe -f -d -s 00000006.app 00000006-31.delta IOS31\00000006.app >NUL
set /a temperrorlev=%errorlevel%
set modul=xdelta.exe
if not %temperrorlev%==0 goto error_patching

move IOS80\00000006.app 00000006.app >NUL
set /a temperrorlev=%errorlevel%
set modul=move.exe
if not %temperrorlev%==0 goto error_patching

cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo --------------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :-------   : 70%%

call xdelta3.exe -f -d -s 00000006.app 00000006-80.delta IOS80\00000006.app >NUL
set /a temperrorlev=%errorlevel%
set modul=xdelta3.exe
if not %temperrorlev%==0 goto error_patching

mkdir WAD
set /a temperrorlev=%errorlevel%
set modul=mkdir.exe
if not %temperrorlev%==0 goto error_patching

cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :--------  : 80%%
call Sharpii.exe WAD -p IOS31\ WAD\IOS31.wad -fs >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

call Sharpii.exe WAD -p IOS80\ WAD\IOS80.wad -fs >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :--------- : 90%%
del 00000006.app /q >NUL
set /a temperrorlev=%errorlevel%
set modul=del.exe
if not %temperrorlev%==0 goto error_patching
del IOS31-old.wad /q >NUL
set /a temperrorlev=%errorlevel%
set modul=del.exe
if not %temperrorlev%==0 goto error_patching
del IOS80-old.wad /q >NUL
set /a temperrorlev=%errorlevel%
set modul=del.exe
if not %temperrorlev%==0 goto error_patching
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :--------- : 93%%
rmdir /s /q IOS31 >NUL
set /a temperrorlev=%errorlevel%
set modul=rmdir.exe
if not %temperrorlev%==0 goto error_patching

rmdir /s /q IOS80 >NUL
set /a temperrorlev=%errorlevel%
set modul=rmdir.exe
if not %temperrorlev%==0 goto error_patching

call Sharpii.exe IOS WAD\IOS31.wad -fs -es -np -vp
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Downloading
echo.
echo :----------: 100%%
call Sharpii.exe IOS WAD\IOS80.wad -fs -es -np -vp
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching
rem ### Patching Done ###
goto ask_for_copy_to_an_sd_card
:error_patching
mode 126,35
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
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.              
echo   /     \  There was an error while patching.
echo  /   !   \ Error Code: %temperrorlev%
echo  --------- Failing module: %modul%             
echo.
if not %temperrorlev%==-532459699 echo.
if %temperrorlev%==-532459699 echo  Please check your internet connection. 
echo       Press any key to start patching again.
echo ---------------------------------------------------------------------------------------------------------------------------
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
goto begin_main
:ask_for_copy_to_an_sd_card
mode 126,35
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
echo %text13%
echo %text19%
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo                   1. %text20%              3. Copy files to Desktop and exit                2. %text21%
set /p s=
if %s%==1 goto sd_card_check
if %s%==2 goto end
if %s%==3 goto copy_desktop
goto ask_for_copy_to_an_sd_card
:copy_desktop
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Copying...
echo.
echo Please wait...
copy "WAD" "%userprofile%/Desktop/" >>NUL
goto end
:sd_card_check
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
set sdcard=NotDefined
echo %text22%
goto sd_a
:: Shitty script but it works, duh. :P 
:: Every Wii SD Card should have two folders in it: apps and private. That's how it's being checked :)
:sd_a
set /a check=0
if exist A:\private\wii set /a check=%check%+1
if exist A:\apps set /a check=%check%+1
if %check%==2 set sdcard=A
goto sd_b
:sd_b
set /a check=0
if exist B:\private\wii set /a check=%check%+1
if exist B:\apps set /a check=%check%+1
if %check%==2 set sdcard=B
goto sd_c
:sd_c
set /a check=0
if exist C:\private\wii set /a check=%check%+1
if exist C:\apps set /a check=%check%+1
if %check%==2 set sdcard=C
goto sd_d
:sd_d
set /a check=0
if exist D:\private\wii set /a check=%check%+1
if exist D:\apps set /a check=%check%+1
if %check%==2 set sdcard=D
goto sd_e
:sd_e
set /a check=0
if exist E:\private\wii set /a check=%check%+1
if exist E:\apps set /a check=%check%+1
if %check%==2 set sdcard=E
goto sd_f
:sd_f
set /a check=0
if exist F:\private\wii set /a check=%check%+1
if exist F:\apps set /a check=%check%+1
if %check%==2 set sdcard=F
goto sd_g
:sd_g
set /a check=0
if exist G:\private\wii set /a check=%check%+1
if exist G:\apps set /a check=%check%+1
if %check%==2 set sdcard=G
goto sd_h
:sd_h
set /a check=0
if exist H:\private\wii set /a check=%check%+1
if exist H:\apps set /a check=%check%+1
if %check%==2 set sdcard=H
goto sd_i
:sd_i
set /a check=0
if exist I:\private\wii set /a check=%check%+1
if exist I:\apps set /a check=%check%+1
if %check%==2 set sdcard=J
goto sd_j
:sd_j
set /a check=0
if exist J:\private\wii set /a check=%check%+1
if exist J:\apps set /a check=%check%+1
if %check%==2 set sdcard=J
goto sd_k
:sd_k
set /a check=0
if exist K:\private\wii set /a check=%check%+1
if exist K:\apps set /a check=%check%+1
if %check%==2 set sdcard=K
goto sd_l
:sd_l
set /a check=0
if exist L:\private\wii set /a check=%check%+1
if exist L:\apps set /a check=%check%+1
if %check%==2 set sdcard=L
goto sd_m
:sd_m
set /a check=0
if exist M:\private\wii set /a check=%check%+1
if exist M:\apps set /a check=%check%+1
if %check%==2 set sdcard=M
goto sd_n
:sd_n
set /a check=0
if exist N:\private\wii set /a check=%check%+1
if exist N:\apps set /a check=%check%+1
if %check%==2 set sdcard=N
goto sd_o
:sd_o
set /a check=0
if exist O:\private\wii set /a check=%check%+1
if exist O:\apps set /a check=%check%+1
if %check%==2 set sdcard=O
goto sd_p
:sd_p
set /a check=0
if exist P:\private\wii set /a check=%check%+1
if exist P:\apps set /a check=%check%+1
if %check%==2 set sdcard=P
goto sd_r
:sd_r
set /a check=0
if exist R:\private\wii set /a check=%check%+1
if exist R:\apps set /a check=%check%+1
if %check%==2 set sdcard=R
goto sd_s
:sd_s
set /a check=0
if exist S:\private\wii set /a check=%check%+1
if exist S:\apps set /a check=%check%+1
if %check%==2 set sdcard=S
goto sd_t
:sd_t
set /a check=0
if exist T:\private\wii set /a check=%check%+1
if exist T:\apps set /a check=%check%+1
if %check%==2 set sdcard=T
goto sd_u
:sd_u
set /a check=0
if exist U:\private\wii set /a check=%check%+1
if exist U:\apps set /a check=%check%+1
if %check%==2 set sdcard=U
goto sd_w
:sd_w
set /a check=0
if exist W:\private\wii set /a check=%check%+1
if exist W:\apps set /a check=%check%+1
if %check%==2 set sdcard=W
goto sd_x
:sd_x
set /a check=0
if exist X:\private\wii set /a check=%check%+1
if exist X:\apps set /a check=%check%+1
if %check%==2 set sdcard=X
goto sd_y
:sd_y
set /a check=0
if exist Y:\private\wii set /a check=%check%+1
if exist Y:\apps set /a check=%check%+1
if %check%==2 set sdcard=Y
goto sd_z
:sd_z
set /a check=0
if exist Z:\private\wii set /a check=%check%+1
if exist Z:\apps set /a check=%check%+1
if %check%==2 set sdcard=Z
goto sd_card_show
:sd_card_show
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
if %sdcard%==NotDefined echo %text23%
if %sdcard%==NotDefined echo %text24%
if not %sdcard%==NotDefined goto sd_card_defined
pause>NUL
goto ask_for_copy_to_an_sd_card
:sd_card_defined
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
echo %text25% %sdcard%
echo %text26%
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo 1. %text27%             2. %text28%                  3. %text29%
set /p s=
if %s%==1 goto sd_card_copying
if %s%==2 goto change_sd_card_letter
if %s%==3 goto ask_for_copy_to_an_sd_card
goto sd_card_defined
:change_sd_card_letter
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
echo %text25% %sdcard%
echo.
echo %text30% (e.g H)
set /p sdcard=
goto sd_card_defined
:sd_card_error
mode 126,35
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Error.
echo.
echo %text31%
pause
goto ask_for_copy_to_an_sd_card
:sd_card_copying
set /a copyingsdcard=1
set /a errorcopying=0
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
echo %text32%
copy "WAD" "%sdcard%:\" >NUL || set /a errorcopying=1
if %errorcopying%==1 goto sd_card_error
goto end


:end
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
goto end1
:end1
mode 126,35
cls
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Thanks for using the Patcher! :)
echo.
if %patchingok%==1 echo %text13%
if %patchingok%==1 echo %text14%
echo.
if %copyingsdcard%==1 echo %text33%
echo.
echo Exiting the patcher in...
if %exiting%==10 echo :----------: 10
if %exiting%==9 echo :--------- : 9
if %exiting%==8 echo :--------  : 8
if %exiting%==7 echo :-------   : 7
if %exiting%==6 echo :------    : 6
if %exiting%==5 echo :-----     : 5
if %exiting%==4 echo :----      : 4
if %exiting%==3 echo :---       : 3
if %exiting%==2 echo :--        : 2
if %exiting%==1 echo :-         : 1
if %exiting%==0 echo :          :
if %copyingsdcard%==0 if %exiting%==0 start WAD
if %copyingsdcard%==1 if %exiting%==0 start %sdcard%:\WAD
if %exiting%==0 exit
if %timeouterror%==0 timeout 1 /nobreak >NUL
if %timeouterror%==1 ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto end1
