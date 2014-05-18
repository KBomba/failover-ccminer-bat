@echo off
:: p=2.60 - set minimum price for mining on nicehash.
:: d=0.01 - set difficult for mining on nicehash
ccminer.exe -q -a x11 -o stratum+tcp://stratum.nicehash.com:3336 -u BTC_Wallet -p p=2.60;d=0.01 -r 0 -R 1
exit