@echo off
set nicehashs=false
set failovers=false
:loop
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%

set year=%date:~-4%
set month=%date:~3,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%

set datetimef=%year%-%month%-%day% %hour%:%min%:%secs%

if "%nicehashs%"=="false" (
	start "nicehash_test" /MIN nicehash_test.bat
)

timeout 10 /NOBREAK >nul

tasklist /FI "WINDOWTITLE eq nicehash_test*" 2>NUL | find /I /N "cmd.exe" >NUL
if "%ERRORLEVEL%"=="1" (
	set nicehashs=false
	echo [%datetimef%] Nicehash checked. Price BTC/GH/Day is lower then we set.
)
if "%ERRORLEVEL%"=="0" (
	set nicehashs=true
	set failovers=false
	echo [%datetimef%] Price is good. Mining on Nicehash!
	taskkill /F /T /FI "WINDOWTITLE eq nicehash_failover*" >NUL
)


tasklist /FI "WINDOWTITLE eq nicehash_failover*" 2>NUL |find /I /N "cmd.exe" >NUL
if "%ERRORLEVEL%"=="1" set failovers=false
if "%ERRORLEVEL%"=="0" set failovers=true


if "%nicehashs%"=="false" if "%failovers%"=="false" (
	start "nicehash_failover" /MIN nicehash_failover.bat
	set failovers=true
)

timeout 30 /NOBREAK >nul

goto loop
