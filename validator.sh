#!/bin/bash

export RUST_LOG=warn
export RUST_BACKTRACE=1

exec solana-validator \
    --identity /home/nikossoftwaredev/solana-rpc-setup/solana-keys/validator-keypair.json \
    --ledger /var/nikossoftwaredev/data/ledger \
    --trusted-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
    --trusted-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
    --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --no-voting \
    --snapshot-interval-slots 1000 \
    --rpc-port 8899 \
    --rpc-bind-address 127.0.0.1 \
    --dynamic-port-range 8000-8014 \
    --wal-recovery-mode skip_any_corrupted_record \
    --init-complete-file /var/nikossoftwaredev/data/init-completed \
    --snapshot-archive-format lz4 \
    --require-tower \
    --no-wait-for-vote-to-start-leader \
    --limit-ledger-size 50000000 \
    --accounts /var/nikossoftwaredev/accounts \
    --log -
