#!/bin/bash
exec solana-validator \
    --identity /home/root/solana-rpc-setup/solana-keys/validator-keypair.json \
    --ledger /var/solana/data/ledger \
    --trusted-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
    --trusted-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
    --trusted-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
    --trusted-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
    --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
    --no-voting \
    --snapshot-interval-slots 500 \
    --maximum-local-snapshot-age 500 \
    --rpc-port 8899 \
    --rpc-bind-address 0.0.0.0 \
    --dynamic-port-range 8000-8020 \

    --no-port-check \
    --wal-recovery-mode skip_any_corrupted_record \
    --enable-rpc-transaction-history \
    --enable-cpi-and-log-storage \
    --init-complete-file /var/solana/data/init-completed \
    --snapshot-compression none \
    --require-tower \
    --no-wait-for-vote-to-start-leader \
    --no-poh-speed-test \
    --limit-ledger-size 50000000 \
    --accounts /var/solana/accounts \
    --log 