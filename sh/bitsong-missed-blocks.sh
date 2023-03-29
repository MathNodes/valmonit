#!/bin/bash

PUBKEY='{"@type":"/cosmos.crypto.ed25519.PubKey","key":"J3nfbscmoMgrrnzJRf53D9iLPPplj+zKuGmsvmIUn5Q="}'
export HOME="/home/bitsong"

MISSED_BLOCKS=`/home/bitsong/go/bin/bitsongd query slashing signing-info $PUBKEY  | grep "missed_blocks" | cut -d '"' -f 2`

if [[ $MISSED_BLOCKS -gt 500 ]]; then
        echo "Missed Blocks: $MISSED_BLOCKS"
        exit 1
elif [ -z $MISSED_BLOCKS ]; then
        echo "Missed Blocks: 0"
        exit 0
else
        echo "Missed Blocks: $MISSED_BLOCKS"
        exit 0
fi

