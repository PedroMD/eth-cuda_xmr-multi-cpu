#!/bin/sh -x

xmr_pool_uri=$1
xmr_username=$2
xmr_password=$3
xmr_threads=$4
xmr_cpu_usage=$5
xmr_donate=$6
eth_f_flag=$7

#sysctl -w vm.nr_hugepages=128

/cpp-ethereum/build/ethminer/ethminer -U -F $eth_f_flag --farm-recheck 400 &
/xmrig-2.3.1/xmrig -o $xmr_pool_uri -u $xmr_username -p $xmr_password -k -t $xmr_threads --max-cpu-usage=$xmr_cpu_usage --donate-level=$xmr_donate

