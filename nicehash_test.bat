set user=1KYMNgy5Lk9T8gJhqKQ86UEdmgPzcRpjvT
set price=2.5
set diff=0.01

ccminer.exe -a x11 -o stratum+tcp://stratum.nicehash.com:3336 -u %user% -p p=%price%;d=%diff% -r 0 -R 1
exit