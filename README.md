failover-ccminer-bat
====================

Failover support for ccminer v0.2

Started by 'zelante', https://bitcointalk.org/index.php?topic=167229.msg6803214#msg6803214


Change following to your preferences:

-nicehash_test.bat-

ccminer: The ccminer version you're supposed to use

user: The bitcoinaddress you'd like to use for NiceHash

price: The minimum price NiceHash should be paying for your hashes, in BTC/GH/DAY

difficulty: The difficulty you'd like for your worker


-nicehash_failover.bat-

ccminer: The ccminer version you're supposed to use

failover: The stratum or http for your failover. Has to include complete URI!

user: The user you'd like to use for your failover. BTC address or name.worker

pass: The password for that user

