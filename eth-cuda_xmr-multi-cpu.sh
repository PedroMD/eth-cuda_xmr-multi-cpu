#!/bin/sh -x

xmr_wallet=$1
xmr_payment_id=$2
xmr_worker_id=$3
xmr_pool_email=$4
xmr_pool_uri=$5

eth_f_flag=$6

sysctl -w vm.nr_hugepages=128

#/xmr-stak-cpu/bin/xmr-stak-cpu /xmr-stak-cpu/bin/config.txt &
/cpp-ethereum/build/ethminer/ethminer -U -F $eth_f_flag --farm-recheck 400 &
/cpuminer-multi/cpuminer -a cryptonight -o $xmr_pool_uri -u $xmr_wallet.$xmr_payment_id.$xmr_worker_id -p $xmr_pool_email

