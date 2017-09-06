@echo off
:: The version variable - it's being used to check for update and just to show user what version is user using.
set version=1.8.2
if exist temp.bat del /q temp.bat
if exist "C:\Users\%username%\Desktop\IOSPatcherDebug.txt" goto debug_load
:1
set /a copyingsdcard=0
set /a translationsserror=0
:: Window size (Lines, columns)
set mode=126,36
mode %mode%
:: Coding page (in order to make IOS Patcher on Windows XP working, this command has been disabled)
:: chcp 65001
set error4112=0
set filcheck=0
set patchingok=1

:: Window Title
title IOS Patcher for RiiConnect24 v.%version%  Created by @Larsenv, @KcrPL
set last_build=2017/09/06
set at=23:30
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
set /a patherror=0
if "%cd%"=="%windir%\system32" set /a patherror=1
if %patherror%==0 if not exist patch.bat set /a patherror=2
	
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
mode %mode%
cls
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
if %patherror%==0 echo              `..````                                                  
if %patherror%==0 echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
if %patherror%==0 echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
if %patherror%==0 echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd               

if %patherror%==1 echo :----------------------------------------------------------------:                
if %patherror%==1 echo : Warning: Please run this application without admin privilages. :               
if %patherror%==1 echo :----------------------------------------------------------------:

if %patherror%==2 echo :------------------------------------------------------------------------------------------------------:                
if %patherror%==2 echo : Warning: patch.bat not found. You may be running this application from unknown and untrusted source. :               
if %patherror%==2 echo :------------------------------------------------------------------------------------------------------:

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

if %patherror%==1 goto begin_main

set /a errorwinxp=0
timeout -0 /nobreak >NUL || set /a errorwinxp=1
if %errorwinxp%==1 goto winxp_notice

set /a eula=0
if not exist %MainFolder% md %MainFolder%
if not exist %MainFolder%\eula.txt echo 0 >>%MainFolder%\eula.txt
if exist %MainFolder%\eula.txt set /p eula=<%MainFolder%\eula.txt
if %eula%==0 goto show_eula

goto startup_script
:startup_script
cls
echo.                                                        
echo              `..````                                     :-------------------------:
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`   : Launching powershell... :          
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd   :-------------------------:                
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
powershell -c >NUL
goto check_for_update
:check_for_update
cls
echo.                                                                       
echo              `..````                                     :-------------------------:
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`   : Checking for updates... :          
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd   :-------------------------:     
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

:: We don't support Windows XP anymore. Windows XP don't have timeout command, it means that if that command will be runned on Windows XP it will return exit code 1. 

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
echo  We will allow you to use this program. But make sure to have .NET Framework 3.5 installed in order to make it work.
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
mode %mode%
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
goto begin

:DoNotTouchThisSection
set error4112=1
goto error4112
:error_code_error
mode %mode%
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
mode %mode%
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
mode %mode%
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Configuring
echo.
echo Are you gonna be using this patcher for Wii or WiiU?
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo                          1. Wii                                                 2. WiiU
set /p s=Choose:
if %s%==1 goto 4
if %s%==2 goto error_3
goto 3
:error_3
mode %mode%
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Error.
echo.
echo Unfortunately, you cannot use this patcher for Wii U :(
echo.
echo If you were joking, press anything to go back
echo If not, close this program.
pause>NUL
goto 3
:4
mode %mode%
set instalorder=1
set intrepeat=0
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Info.
echo.
echo We need to download IOS 31 and 80.
echo Click any button to proceed to download.
echo.
pause>NUL
goto 5

:5
mode %mode%	
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
mode %mode%
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
echo.
if %temperrorlev%==-532459699 echo Please check your internet connection.
if %temperrorlev%==-2146232576 echo Please install .NET Framework 3.5, than try to patch again.  
echo       Press any key to return to main menu.
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
mode %mode%
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] SD Card
echo.
echo Patching is done.
echo Do you want to copy patched files to an SD Card?
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo                   1. Yes              3. Copy files to Desktop and exit                2. No
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
echo Please wait...
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
if %sdcard%==NotDefined echo An SD card was not found in the system.
if %sdcard%==NotDefined echo Please connect SD Card and press any button to try again.
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
echo Current SD Card Letter: %sdcard%
echo Do you want to change SD Card drive letter?
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo 1. Continue and copy files to SD Card             2. Change drive letter                  3. Exit
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
echo Current SD Card Letter: %sdcard%
echo.
echo Type in new drive letter (e.g H)
set /p sdcard=
goto sd_card_defined
:sd_card_error
mode %mode%
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Error.
echo.
echo There was an error while copying files.
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
echo Please wait... copying.
copy "WAD" "%sdcard%:\" >NUL || set /a errorcopying=1
if %errorcopying%==1 goto sd_card_error
goto end


:end
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
goto end1
:end1
mode %mode%
cls
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ---------------------------------------------------------------------------------------------------------------------------
echo  [*] Thanks for using the Patcher! :)
echo.
if %patchingok%==1 echo Patching is done.
if %patchingok%==1 echo Patched IOS files will be in folder called "WAD".
echo.
if %copyingsdcard%==1 echo Files has been copied to SD Card to folder called "WAD"
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










:show_eula
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
echo    /---\   IOS Patcher is shared under GNU Affero General Public License v3.0 license.              
echo   /     \  In order to use this program, you need to accept the license.
echo  /   !   \ 
echo  ---------  
echo             1. Read the license    2. Dismiss    3. I accept.    4. I do not accept          
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
if %s%==1 goto read_eula
if %s%==2 goto begin_main
if %s%==3 goto set_accepted_eula
if %s%==4 goto begin_main
goto show_eula
:read_eula
cls
mode 100,9001
echo :------------------------------:
echo : Press any button to continue :
echo :------------------------------:
echo.                    GNU AFFERO GENERAL PUBLIC LICENSE
echo.                       Version 3, 19 November 2007
echo.
echo. Copyright (C) 2007 Free Software Foundation, Inc. http://fsf.org/
echo. Everyone is permitted to copy and distribute verbatim copies
echo. of this license document, but changing it is not allowed.
pause>NUL
echo.
echo.                            Preamble
echo.
echo.  The GNU Affero General Public License is a free, copyleft license for
echo.software and other kinds of works, specifically designed to ensure
echo.cooperation with the community in the case of network server software.
echo.
echo.  The licenses for most software and other practical works are designed
echo.to take away your freedom to share and change the works.  By contrast,
echo.our General Public Licenses are intended to guarantee your freedom to
echo.share and change all versions of a program--to make sure it remains free
echo.software for all its users.
echo.
echo.  When we speak of free software, we are referring to freedom, not
echo.price.  Our General Public Licenses are designed to make sure that you
echo.have the freedom to distribute copies of free software (and charge for
echo.them if you wish), that you receive source code or can get it if you
echo.want it, that you can change the software or use pieces of it in new
echo.free programs, and that you know you can do these things.
echo.
echo.  Developers that use our General Public Licenses protect your rights
echo.with two steps: (1) assert copyright on the software, and (2) offer
echo.you this License which gives you legal permission to copy, distribute
echo.and/or modify the software.
echo.
echo.  A secondary benefit of defending all users' freedom is that
echo.improvements made in alternate versions of the program, if they
echo.receive widespread use, become available for other developers to
echo.incorporate.  Many developers of free software are heartened and
echo.encouraged by the resulting cooperation.  However, in the case of
echo.software used on network servers, this result may fail to come about.
echo.The GNU General Public License permits making a modified version and
echo.letting the public access it on a server without ever releasing its
echo.source code to the public.
echo.
echo.  The GNU Affero General Public License is designed specifically to
echo.ensure that, in such cases, the modified source code becomes available
echo.to the community.  It requires the operator of a network server to
echo.provide the source code of the modified version running there to the
echo.users of that server.  Therefore, public use of a modified version, on
echo.a publicly accessible server, gives the public access to the source
echo.code of the modified version.
echo.
echo.  An older license, called the Affero General Public License and
echo.published by Affero, was designed to accomplish similar goals.  This is
echo.a different license, not a version of the Affero GPL, but Affero has
echo.released a new version of the Affero GPL which permits relicensing under
echo.this license.
echo.
echo.  The precise terms and conditions for copying, distribution and
echo.modification follow.
pause>NUL
echo.
echo.                       TERMS AND CONDITIONS
echo.
echo.  0. Definitions.
echo.
echo.  "This License" refers to version 3 of the GNU Affero General Public License.
echo.
echo.  "Copyright" also means copyright-like laws that apply to other kinds of
echo.works, such as semiconductor masks.
echo.
echo.  "The Program" refers to any copyrightable work licensed under this
echo.License.  Each licensee is addressed as "you".  "Licensees" and
echo."recipients" may be individuals or organizations.
echo.
echo.  To "modify" a work means to copy from or adapt all or part of the work
echo.in a fashion requiring copyright permission, other than the making of an
echo.exact copy.  The resulting work is called a "modified version" of the
echo.earlier work or a work "based on" the earlier work.
echo.
echo.  A "covered work" means either the unmodified Program or a work based
echo.on the Program.
echo.
echo.  To "propagate" a work means to do anything with it that, without
echo.permission, would make you directly or secondarily liable for
echo.infringement under applicable copyright law, except executing it on a
echo.computer or modifying a private copy.  Propagation includes copying,
echo.distribution (with or without modification), making available to the
echo.public, and in some countries other activities as well.
echo.
echo.  To "convey" a work means any kind of propagation that enables other
echo.parties to make or receive copies.  Mere interaction with a user through
echo.a computer network, with no transfer of a copy, is not conveying.
echo.
echo.  An interactive user interface displays "Appropriate Legal Notices"
echo.to the extent that it includes a convenient and prominently visible
echo.feature that (1) displays an appropriate copyright notice, and (2)
echo.tells the user that there is no warranty for the work (except to the
echo.extent that warranties are provided), that licensees may convey the
echo.work under this License, and how to view a copy of this License.  If
echo.the interface presents a list of user commands or options, such as a
echo.menu, a prominent item in the list meets this criterion.
echo.
echo.  1. Source Code.
echo.
echo.  The "source code" for a work means the preferred form of the work
echo.for making modifications to it.  "Object code" means any non-source
echo.form of a work.
echo.
echo.  A "Standard Interface" means an interface that either is an official
echo.standard defined by a recognized standards body, or, in the case of
echo.interfaces specified for a particular programming language, one that
echo.is widely used among developers working in that language.
echo.
echo.  The "System Libraries" of an executable work include anything, other
echo.than the work as a whole, that (a) is included in the normal form of
echo.packaging a Major Component, but which is not part of that Major
echo.Component, and (b) serves only to enable use of the work with that
echo.Major Component, or to implement a Standard Interface for which an
echo.implementation is available to the public in source code form.  A
echo."Major Component", in this context, means a major essential component
echo.(kernel, window system, and so on) of the specific operating system
echo.(if any) on which the executable work runs, or a compiler used to
echo.produce the work, or an object code interpreter used to run it.
echo.
echo.  The "Corresponding Source" for a work in object code form means all
echo.the source code needed to generate, install, and (for an executable
echo.work) run the object code and to modify the work, including scripts to
echo.control those activities.  However, it does not include the work's
echo.System Libraries, or general-purpose tools or generally available free
echo.programs which are used unmodified in performing those activities but
echo.which are not part of the work.  For example, Corresponding Source
echo.includes interface definition files associated with source files for
echo.the work, and the source code for shared libraries and dynamically
echo.linked subprograms that the work is specifically designed to require,
echo.such as by intimate data communication or control flow between those
echo.subprograms and other parts of the work.
echo.
echo.  The Corresponding Source need not include anything that users
echo.can regenerate automatically from other parts of the Corresponding
echo.Source.
echo.
echo.  The Corresponding Source for a work in source code form is that
echo.same work.
pause>NUL
echo.
echo.  2. Basic Permissions.
echo.
echo.  All rights granted under this License are granted for the term of
echo.copyright on the Program, and are irrevocable provided the stated
echo.conditions are met.  This License explicitly affirms your unlimited
echo.permission to run the unmodified Program.  The output from running a
echo.covered work is covered by this License only if the output, given its
echo.content, constitutes a covered work.  This License acknowledges your
echo.rights of fair use or other equivalent, as provided by copyright law.
echo.
echo.  You may make, run and propagate covered works that you do not
echo.convey, without conditions so long as your license otherwise remains
echo.in force.  You may convey covered works to others for the sole purpose
echo.of having them make modifications exclusively for you, or provide you
echo.with facilities for running those works, provided that you comply with
echo.the terms of this License in conveying all material for which you do
echo.not control copyright.  Those thus making or running the covered works
echo.for you must do so exclusively on your behalf, under your direction
echo.and control, on terms that prohibit them from making any copies of
echo.your copyrighted material outside their relationship with you.
echo.
echo.  Conveying under any other circumstances is permitted solely under
echo.the conditions stated below.  Sublicensing is not allowed; section 10
echo.makes it unnecessary.
echo.
pause>NUL
echo.  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
echo.
echo.  No covered work shall be deemed part of an effective technological
echo.measure under any applicable law fulfilling obligations under article
echo.11 of the WIPO copyright treaty adopted on 20 December 1996, or
echo.similar laws prohibiting or restricting circumvention of such
echo.measures.
echo.
echo.  When you convey a covered work, you waive any legal power to forbid
echo.circumvention of technological measures to the extent such circumvention
echo.is effected by exercising rights under this License with respect to
echo.the covered work, and you disclaim any intention to limit operation or
echo.modification of the work as a means of enforcing, against the work's
echo.users, your or third parties' legal rights to forbid circumvention of
echo.technological measures.
echo.
pause>NUL
echo.  4. Conveying Verbatim Copies.
echo.
echo.  You may convey verbatim copies of the Program's source code as you
echo.receive it, in any medium, provided that you conspicuously and
echo.appropriately publish on each copy an appropriate copyright notice;
echo.keep intact all notices stating that this License and any
echo.non-permissive terms added in accord with section 7 apply to the code;
echo.keep intact all notices of the absence of any warranty; and give all
echo.recipients a copy of this License along with the Program.
echo.
echo.  You may charge any price or no price for each copy that you convey,
echo.and you may offer support or warranty protection for a fee.
echo.
pause>NUL
echo.  5. Conveying Modified Source Versions.
echo.
echo.  You may convey a work based on the Program, or the modifications to
echo.produce it from the Program, in the form of source code under the
echo.terms of section 4, provided that you also meet all of these conditions:
echo.
echo.    a) The work must carry prominent notices stating that you modified
echo.    it, and giving a relevant date.
echo.
echo.    b) The work must carry prominent notices stating that it is
echo.    released under this License and any conditions added under section
echo.    7.  This requirement modifies the requirement in section 4 to
echo.    "keep intact all notices".
echo.
echo.    c) You must license the entire work, as a whole, under this
echo.    License to anyone who comes into possession of a copy.  This
echo.    License will therefore apply, along with any applicable section 7
echo.    additional terms, to the whole of the work, and all its parts,
echo.    regardless of how they are packaged.  This License gives no
echo.    permission to license the work in any other way, but it does not
echo.    invalidate such permission if you have separately received it.
echo.
echo.    d) If the work has interactive user interfaces, each must display
echo.    Appropriate Legal Notices; however, if the Program has interactive
echo.    interfaces that do not display Appropriate Legal Notices, your
echo.    work need not make them do so.
echo.
echo.  A compilation of a covered work with other separate and independent
echo.works, which are not by their nature extensions of the covered work,
echo.and which are not combined with it such as to form a larger program,
echo.in or on a volume of a storage or distribution medium, is called an
echo."aggregate" if the compilation and its resulting copyright are not
echo.used to limit the access or legal rights of the compilation's users
echo.beyond what the individual works permit.  Inclusion of a covered work
echo.in an aggregate does not cause this License to apply to the other
echo.parts of the aggregate.
echo.
pause>NUL
echo.  6. Conveying Non-Source Forms.
echo.
echo.  You may convey a covered work in object code form under the terms
echo.of sections 4 and 5, provided that you also convey the
echo.machine-readable Corresponding Source under the terms of this License,
echo.in one of these ways:
echo.
echo.    a) Convey the object code in, or embodied in, a physical product
echo.    (including a physical distribution medium), accompanied by the
echo.    Corresponding Source fixed on a durable physical medium
echo.    customarily used for software interchange.
echo.
echo.    b) Convey the object code in, or embodied in, a physical product
echo.    (including a physical distribution medium), accompanied by a
echo.    written offer, valid for at least three years and valid for as
echo.    long as you offer spare parts or customer support for that product
echo.    model, to give anyone who possesses the object code either (1) a
echo.    copy of the Corresponding Source for all the software in the
echo.    product that is covered by this License, on a durable physical
echo.    medium customarily used for software interchange, for a price no
echo.    more than your reasonable cost of physically performing this
echo.    conveying of source, or (2) access to copy the
echo.    Corresponding Source from a network server at no charge.
echo.
echo.    c) Convey individual copies of the object code with a copy of the
echo.    written offer to provide the Corresponding Source.  This
echo.    alternative is allowed only occasionally and noncommercially, and
echo.    only if you received the object code with such an offer, in accord
echo.    with subsection 6b.
echo.
echo.    d) Convey the object code by offering access from a designated
echo.    place (gratis or for a charge), and offer equivalent access to the
echo.    Corresponding Source in the same way through the same place at no
echo.    further charge.  You need not require recipients to copy the
echo.    Corresponding Source along with the object code.  If the place to
echo.    copy the object code is a network server, the Corresponding Source
echo.    may be on a different server (operated by you or a third party)
echo.    that supports equivalent copying facilities, provided you maintain
echo.    clear directions next to the object code saying where to find the
echo.    Corresponding Source.  Regardless of what server hosts the
echo.    Corresponding Source, you remain obligated to ensure that it is
echo.    available for as long as needed to satisfy these requirements.
echo.
echo.    e) Convey the object code using peer-to-peer transmission, provided
echo.    you inform other peers where the object code and Corresponding
echo.    Source of the work are being offered to the general public at no
echo.    charge under subsection 6d.
echo.
echo.  A separable portion of the object code, whose source code is excluded
echo.from the Corresponding Source as a System Library, need not be
echo.included in conveying the object code work.
echo.
echo.  A "User Product" is either (1) a "consumer product", which means any
echo.tangible personal property which is normally used for personal, family,
echo.or household purposes, or (2) anything designed or sold for incorporation
echo.into a dwelling.  In determining whether a product is a consumer product,
echo.doubtful cases shall be resolved in favor of coverage.  For a particular
echo.product received by a particular user, "normally used" refers to a
echo.typical or common use of that class of product, regardless of the status
echo.of the particular user or of the way in which the particular user
echo.actually uses, or expects or is expected to use, the product.  A product
echo.is a consumer product regardless of whether the product has substantial
echo.commercial, industrial or non-consumer uses, unless such uses represent
echo.the only significant mode of use of the product.
echo.
echo.  "Installation Information" for a User Product means any methods,
echo.procedures, authorization keys, or other information required to install
echo.and execute modified versions of a covered work in that User Product from
echo.a modified version of its Corresponding Source.  The information must
echo.suffice to ensure that the continued functioning of the modified object
echo.code is in no case prevented or interfered with solely because
echo.modification has been made.
echo.
echo.  If you convey an object code work under this section in, or with, or
echo.specifically for use in, a User Product, and the conveying occurs as
echo.part of a transaction in which the right of possession and use of the
echo.User Product is transferred to the recipient in perpetuity or for a
echo.fixed term (regardless of how the transaction is characterized), the
echo.Corresponding Source conveyed under this section must be accompanied
echo.by the Installation Information.  But this requirement does not apply
echo.if neither you nor any third party retains the ability to install
echo.modified object code on the User Product (for example, the work has
echo.been installed in ROM).
echo.
echo.  The requirement to provide Installation Information does not include a
echo.requirement to continue to provide support service, warranty, or updates
echo.for a work that has been modified or installed by the recipient, or for
echo.the User Product in which it has been modified or installed.  Access to a
echo.network may be denied when the modification itself materially and
echo.adversely affects the operation of the network or violates the rules and
echo.protocols for communication across the network.
echo.
echo.  Corresponding Source conveyed, and Installation Information provided,
echo.in accord with this section must be in a format that is publicly
echo.documented (and with an implementation available to the public in
echo.source code form), and must require no special password or key for
echo.unpacking, reading or copying.
echo.
pause>NUL
echo.  7. Additional Terms.
echo.
echo.  "Additional permissions" are terms that supplement the terms of this
echo.License by making exceptions from one or more of its conditions.
echo.Additional permissions that are applicable to the entire Program shall
echo.be treated as though they were included in this License, to the extent
echo.that they are valid under applicable law.  If additional permissions
echo.apply only to part of the Program, that part may be used separately
echo.under those permissions, but the entire Program remains governed by
echo.this License without regard to the additional permissions.
echo.
echo.  When you convey a copy of a covered work, you may at your option
echo.remove any additional permissions from that copy, or from any part of
echo.it.  (Additional permissions may be written to require their own
echo.removal in certain cases when you modify the work.)  You may place
echo.additional permissions on material, added by you to a covered work,
echo.for which you have or can give appropriate copyright permission.
echo.
echo.  Notwithstanding any other provision of this License, for material you
echo.add to a covered work, you may (if authorized by the copyright holders of
echo.that material) supplement the terms of this License with terms:
echo.
echo.    a) Disclaiming warranty or limiting liability differently from the
echo.    terms of sections 15 and 16 of this License; or
echo.
echo.    b) Requiring preservation of specified reasonable legal notices or
echo.    author attributions in that material or in the Appropriate Legal
echo.    Notices displayed by works containing it; or
echo.
echo.    c) Prohibiting misrepresentation of the origin of that material, or
echo.    requiring that modified versions of such material be marked in
echo.    reasonable ways as different from the original version; or
echo.
echo.    d) Limiting the use for publicity purposes of names of licensors or
echo.    authors of the material; or
echo.
echo.    e) Declining to grant rights under trademark law for use of some
echo.    trade names, trademarks, or service marks; or
echo.
echo.    f) Requiring indemnification of licensors and authors of that
echo.    material by anyone who conveys the material (or modified versions of
echo.    it) with contractual assumptions of liability to the recipient, for
echo.    any liability that these contractual assumptions directly impose on
echo.    those licensors and authors.
echo.
echo.  All other non-permissive additional terms are considered "further
echo.restrictions" within the meaning of section 10.  If the Program as you
echo.received it, or any part of it, contains a notice stating that it is
echo.governed by this License along with a term that is a further
echo.restriction, you may remove that term.  If a license document contains
echo.a further restriction but permits relicensing or conveying under this
echo.License, you may add to a covered work material governed by the terms
echo.of that license document, provided that the further restriction does
echo.not survive such relicensing or conveying.
echo.
echo.  If you add terms to a covered work in accord with this section, you
echo.must place, in the relevant source files, a statement of the
echo.additional terms that apply to those files, or a notice indicating
echo.where to find the applicable terms.
echo.
echo.  Additional terms, permissive or non-permissive, may be stated in the
echo.form of a separately written license, or stated as exceptions;
echo.the above requirements apply either way.
echo.
pause>NUL
echo.  8. Termination.
echo.
echo.  You may not propagate or modify a covered work except as expressly
echo.provided under this License.  Any attempt otherwise to propagate or
echo.modify it is void, and will automatically terminate your rights under
echo.this License (including any patent licenses granted under the third
echo.paragraph of section 11).
echo.
echo.  However, if you cease all violation of this License, then your
echo.license from a particular copyright holder is reinstated (a)
echo.provisionally, unless and until the copyright holder explicitly and
echo.finally terminates your license, and (b) permanently, if the copyright
echo.holder fails to notify you of the violation by some reasonable means
echo.prior to 60 days after the cessation.
echo.
echo.  Moreover, your license from a particular copyright holder is
echo.reinstated permanently if the copyright holder notifies you of the
echo.violation by some reasonable means, this is the first time you have
echo.received notice of violation of this License (for any work) from that
echo.copyright holder, and you cure the violation prior to 30 days after
echo.your receipt of the notice.
echo.
echo.  Termination of your rights under this section does not terminate the
echo.licenses of parties who have received copies or rights from you under
echo.this License.  If your rights have been terminated and not permanently
echo.reinstated, you do not qualify to receive new licenses for the same
echo.material under section 10.
echo.
echo.  9. Acceptance Not Required for Having Copies.
echo.
echo.  You are not required to accept this License in order to receive or
echo.run a copy of the Program.  Ancillary propagation of a covered work
echo.occurring solely as a consequence of using peer-to-peer transmission
echo.to receive a copy likewise does not require acceptance.  However,
echo.nothing other than this License grants you permission to propagate or
echo.modify any covered work.  These actions infringe copyright if you do
echo.not accept this License.  Therefore, by modifying or propagating a
echo.covered work, you indicate your acceptance of this License to do so.
echo.
echo.  10. Automatic Licensing of Downstream Recipients.
echo.
echo.  Each time you convey a covered work, the recipient automatically
echo.receives a license from the original licensors, to run, modify and
echo.propagate that work, subject to this License.  You are not responsible
echo.for enforcing compliance by third parties with this License.
echo.
echo.  An "entity transaction" is a transaction transferring control of an
echo.organization, or substantially all assets of one, or subdividing an
echo.organization, or merging organizations.  If propagation of a covered
echo.work results from an entity transaction, each party to that
echo.transaction who receives a copy of the work also receives whatever
echo.licenses to the work the party's predecessor in interest had or could
echo.give under the previous paragraph, plus a right to possession of the
echo.Corresponding Source of the work from the predecessor in interest, if
echo.the predecessor has it or can get it with reasonable efforts.
echo.
echo.  You may not impose any further restrictions on the exercise of the
echo.rights granted or affirmed under this License.  For example, you may
echo.not impose a license fee, royalty, or other charge for exercise of
echo.rights granted under this License, and you may not initiate litigation
echo.(including a cross-claim or counterclaim in a lawsuit) alleging that
echo.any patent claim is infringed by making, using, selling, offering for
echo.sale, or importing the Program or any portion of it.
echo.
pause>NUL
echo.  11. Patents.
echo.
echo.  A "contributor" is a copyright holder who authorizes use under this
echo.License of the Program or a work on which the Program is based.  The
echo.work thus licensed is called the contributor's "contributor version".
echo.
echo.  A contributor's "essential patent claims" are all patent claims
echo.owned or controlled by the contributor, whether already acquired or
echo.hereafter acquired, that would be infringed by some manner, permitted
echo.by this License, of making, using, or selling its contributor version,
echo.but do not include claims that would be infringed only as a
echo.consequence of further modification of the contributor version.  For
echo.purposes of this definition, "control" includes the right to grant
echo.patent sublicenses in a manner consistent with the requirements of
echo.this License.
echo.
echo.  Each contributor grants you a non-exclusive, worldwide, royalty-free
echo.patent license under the contributor's essential patent claims, to
echo.make, use, sell, offer for sale, import and otherwise run, modify and
echo.propagate the contents of its contributor version.
echo.
echo.  In the following three paragraphs, a "patent license" is any express
echo.agreement or commitment, however denominated, not to enforce a patent
echo.(such as an express permission to practice a patent or covenant not to
echo.sue for patent infringement).  To "grant" such a patent license to a
echo.party means to make such an agreement or commitment not to enforce a
echo.patent against the party.
echo.
echo.  If you convey a covered work, knowingly relying on a patent license,
echo.and the Corresponding Source of the work is not available for anyone
echo.to copy, free of charge and under the terms of this License, through a
echo.publicly available network server or other readily accessible means,
echo.then you must either (1) cause the Corresponding Source to be so
echo.available, or (2) arrange to deprive yourself of the benefit of the
echo.patent license for this particular work, or (3) arrange, in a manner
echo.consistent with the requirements of this License, to extend the patent
echo.license to downstream recipients.  "Knowingly relying" means you have
echo.actual knowledge that, but for the patent license, your conveying the
echo.covered work in a country, or your recipient's use of the covered work
echo.in a country, would infringe one or more identifiable patents in that
echo.country that you have reason to believe are valid.
echo.
echo.  If, pursuant to or in connection with a single transaction or
echo.arrangement, you convey, or propagate by procuring conveyance of, a
echo.covered work, and grant a patent license to some of the parties
echo.receiving the covered work authorizing them to use, propagate, modify
echo.or convey a specific copy of the covered work, then the patent license
echo.you grant is automatically extended to all recipients of the covered
echo.work and works based on it.
echo.
echo.  A patent license is "discriminatory" if it does not include within
echo.the scope of its coverage, prohibits the exercise of, or is
echo.conditioned on the non-exercise of one or more of the rights that are
echo.specifically granted under this License.  You may not convey a covered
echo.work if you are a party to an arrangement with a third party that is
echo.in the business of distributing software, under which you make payment
echo.to the third party based on the extent of your activity of conveying
echo.the work, and under which the third party grants, to any of the
echo.parties who would receive the covered work from you, a discriminatory
echo.patent license (a) in connection with copies of the covered work
echo.conveyed by you (or copies made from those copies), or (b) primarily
echo.for and in connection with specific products or compilations that
echo.contain the covered work, unless you entered into that arrangement,
echo.or that patent license was granted, prior to 28 March 2007.
echo.
echo.  Nothing in this License shall be construed as excluding or limiting
echo.any implied license or other defenses to infringement that may
echo.otherwise be available to you under applicable patent law.
echo.
pause>NUL
echo.  12. No Surrender of Others' Freedom.
echo.
echo.  If conditions are imposed on you (whether by court order, agreement or
echo.otherwise) that contradict the conditions of this License, they do not
echo.excuse you from the conditions of this License.  If you cannot convey a
echo.covered work so as to satisfy simultaneously your obligations under this
echo.License and any other pertinent obligations, then as a consequence you may
echo.not convey it at all.  For example, if you agree to terms that obligate you
echo.to collect a royalty for further conveying from those to whom you convey
echo.the Program, the only way you could satisfy both those terms and this
echo.License would be to refrain entirely from conveying the Program.
echo.
pause>NUL
echo.  13. Remote Network Interaction; Use with the GNU General Public License.
echo.
echo.  Notwithstanding any other provision of this License, if you modify the
echo.Program, your modified version must prominently offer all users
echo.interacting with it remotely through a computer network (if your version
echo.supports such interaction) an opportunity to receive the Corresponding
echo.Source of your version by providing access to the Corresponding Source
echo.from a network server at no charge, through some standard or customary
echo.means of facilitating copying of software.  This Corresponding Source
echo.shall include the Corresponding Source for any work covered by version 3
echo.of the GNU General Public License that is incorporated pursuant to the
echo.following paragraph.
echo.
echo.  Notwithstanding any other provision of this License, you have
echo.permission to link or combine any covered work with a work licensed
echo.under version 3 of the GNU General Public License into a single
echo.combined work, and to convey the resulting work.  The terms of this
echo.License will continue to apply to the part which is the covered work,
echo.but the work with which it is combined will remain governed by version
echo.3 of the GNU General Public License.
echo.
pause>NUL
echo.  14. Revised Versions of this License.
echo.
echo.  The Free Software Foundation may publish revised and/or new versions of
echo.the GNU Affero General Public License from time to time.  Such new versions
echo.will be similar in spirit to the present version, but may differ in detail to
echo.address new problems or concerns.
echo.
echo.  Each version is given a distinguishing version number.  If the
echo.Program specifies that a certain numbered version of the GNU Affero General
echo.Public License "or any later version" applies to it, you have the
echo.option of following the terms and conditions either of that numbered
echo.version or of any later version published by the Free Software
echo.Foundation.  If the Program does not specify a version number of the
echo.GNU Affero General Public License, you may choose any version ever published
echo.by the Free Software Foundation.
echo.
echo.  If the Program specifies that a proxy can decide which future
echo.versions of the GNU Affero General Public License can be used, that proxy's
echo.public statement of acceptance of a version permanently authorizes you
echo.to choose that version for the Program.
echo.
echo.  Later license versions may give you additional or different
echo.permissions.  However, no additional obligations are imposed on any
echo.author or copyright holder as a result of your choosing to follow a
echo.later version.
echo.
pause>NUL
echo.  15. Disclaimer of Warranty.
echo.
echo.  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
echo.APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
echo.HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
echo.OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
echo.THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
echo.PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
echo.IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
echo.ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
echo.
pause>NUL
echo.  16. Limitation of Liability.
echo.
echo.  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
echo.WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
echo.THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
echo.GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
echo.USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
echo.DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
echo.PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
echo.EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
echo.SUCH DAMAGES.
echo.
pause>NUL
echo.  17. Interpretation of Sections 15 and 16.
echo.
echo.  If the disclaimer of warranty and limitation of liability provided
echo.above cannot be given local legal effect according to their terms,
echo.reviewing courts shall apply local law that most closely approximates
echo.an absolute waiver of all civil liability in connection with the
echo.Program, unless a warranty or assumption of liability accompanies a
echo.copy of the Program in return for a fee.
echo.
pause>NUL
echo.                     END OF TERMS AND CONDITIONS
echo.
echo.            How to Apply These Terms to Your New Programs
echo.
echo.  If you develop a new program, and you want it to be of the greatest
echo.possible use to the public, the best way to achieve this is to make it
echo.free software which everyone can redistribute and change under these terms.
echo.
echo.  To do so, attach the following notices to the program.  It is safest
echo.to attach them to the start of each source file to most effectively
echo.state the exclusion of warranty; and each file should have at least
echo.the "copyright" line and a pointer to where the full notice is found.
echo.
echo.    one line to give the program's name and a brief idea of what it does.
echo.    Copyright (C) year  name of author
echo.
echo.    This program is free software: you can redistribute it and/or modify
echo.    it under the terms of the GNU Affero General Public License as published
echo.    by the Free Software Foundation, either version 3 of the License, or
echo.    (at your option) any later version.
echo.
echo.    This program is distributed in the hope that it will be useful,
echo.    but WITHOUT ANY WARRANTY; without even the implied warranty of
echo.    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
echo.    GNU Affero General Public License for more details.
echo.
echo.    You should have received a copy of the GNU Affero General Public License
echo.    along with this program.  If not, see http://www.gnu.org/licenses/.
echo.
echo.Also add information on how to contact you by electronic and paper mail.
echo.
echo.  If your software can interact with users remotely through a computer
echo.network, you should also make sure that it provides a way for users to
echo.get its source.  For example, if your program is a web application, its
echo.interface could display a "Source" link that leads users to an archive
echo.of the code.  There are many ways you could offer source, and different
echo.solutions will be better for different programs; see section 13 for the
echo.specific requirements.
echo.
echo.  You should also get your employer (if you work as a programmer) or school,
echo.if any, to sign a "copyright disclaimer" for the program, if necessary.
echo.For more information on this, and how to apply and follow the GNU AGPL, see
echo.http://www.gnu.org/licenses/.
echo.
pause>NUL>NUL
goto accept_eula
:accept_eula
mode %mode%
echo RiiConnect24 IOS Patcher - (C) Larsenv, (C) KcrPL. v%version%. (Compiled on %last_build% at %at%)
echo.
echo Do you accept that?
echo.
echo 1. I Accept
echo 2. I Do Not Accept
echo 3. Read again.	
set /p s=Choose: 
if %s%==1 goto set_accepted_eula
if %s%==2 goto begin_main
if %s%==3 goto read_eula
goto accept_eula
:set_accepted_eula
if exist %MainFolder%\eula.txt del %MainFolder%\eula.txt /q
echo 1 >>%MainFolder%\eula.txt
goto begin_main
