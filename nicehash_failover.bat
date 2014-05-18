set ccminer=ccminer50.exe
set failover=stratum+tcp://useast1.cryptoalts.com:5555
set user=BJcD6wg4nFZ5TLADaXk6mfJZovgGuiYnHF
set pass=x

%ccminer% -a x11 -o %failover% -u %user% -p %pass%
exit