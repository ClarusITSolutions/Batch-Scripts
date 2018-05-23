@echo off
taskkill /F /IM chrome.exe
taskkill /F /IM iexplore.exe
echo *******************************************
echo *******************************************
echo *******************************************
echo *******************************************
echo ***********RUN AS ADMINISTRATOR************
echo *******************************************
echo *******************************************
echo *******************************************
echo *******************************************

set /p id="Clear Passwords? (Y/N): "
if %id%==Y GOTO :remove
if %id%==y GOTO :remove
:keep
ECHO ****KEEP PASS
ECHO **** Clearing %Temp%
cd /D %temp%
del /f /q *
ECHO **** Clearing Windows\Temp
cd C:\Windows\Temp
del /f /q *
ECHO **** Clearing Chrome cache
set ChromeDataDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1  
copy "%ChromeDataDir%\*Login Data*.*" "%ChromeDataDir%\Storage\*Login Data*.*"
del /q /s /f "%ChromeCache%\*.*">nul 2>&1       
del /q /f "%ChromeDataDir%\*History*.*">nul 2>&1   
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1 
move "%ChromeDataDir%\Storage\*Login Data*.*" "%ChromeDataDir%\*Login Data*.*" 
set ChromeDataDir=C:\Users\%USERNAME%\Local Settings\Application Data\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1
del /q /s /f "%ChromeCache%\*.*">nul 2>&1   
del /q /f "%ChromeDataDir%\*History*.*">nul 2>&1
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1  
ECHO **** Clearing Chrome cache DONE
ECHO **** Clearing IE cache
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
ECHO **** Clearing IE cache DONE
pause >nul
goto end


:remove
ECHO ****DELETE PASS
ECHO **** Clearing %Temp%
cd /D %temp%
del /f /q *
ECHO **** Clearing Windows\Temp
cd C:\Windows\Temp
del /f /q *
ECHO **** Clearing Chrome cache
set ChromeDataDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1  
del /q /s /f "%ChromeCache%\*.*">nul 2>&1       
del /q /f "%ChromeDataDir%\*History*.*">nul 2>&1   
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1  
set ChromeDataDir=C:\Users\%USERNAME%\Local Settings\Application Data\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1
del /q /s /f "%ChromeCache%\*.*">nul 2>&1   
del /q /f "%ChromeDataDir%\*History*.*">nul 2>&1    
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1  
ECHO **** Clearing Chrome cache DONE
ECHO **** Clearing IE cache
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
ECHO **** Clearing IE cache DONE
pause >nul
goto end

:end