@echo off
set nicehashs=false
set failovers=false
:loop
if "%nicehashs%"=="false" (
	start "nicehash_test" /MIN nicehash_test.bat
)

timeout 10 /NOBREAK >nul

tasklist /FI "WINDOWTITLE eq nicehash_test*" 2>NUL | find /I /N "cmd.exe">NUL
if "%ERRORLEVEL%"=="0" (
	set nicehashs=true
	set failovers=false
	echo Price is good. Mining on Nicehash!
	taskkill /F /FI "WINDOWTITLE eq nicehash_failover*" >NUL
	taskkill /F /FI "WINDOWTITLE eq nicehash_failover*" >NUL
) else (
	set nicehashs=false
	echo Nicehash checked. Price BTC/GH/Day is lower then we set...
)

if "%nicehashs%"=="false" if "%failovers%"=="false" (
	start "nicehash_failover" nicehash_failover.bat
	set failovers=true
)

timeout 30 /NOBREAK >nul

goto loop
