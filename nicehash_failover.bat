@echo off
:: set failover pool
ccminer.exe -q -a x11 -o stratum+tcp://europe1.darkcoin.miningpoolhub.com:20465 -u user.worker -p password
exit