#!/bin/bash

# Set PATH
export PATH="$PATH:/root/.local/share/solana/install/releases/stable-d0ed878d573c7f5391cd2cba20465407f63f11a8/solana-release/bin"
export RUST_LOG=info
export RUST_BACKTRACE=1

exec solana-validator \
    --identity /root/solana-rpc-setup/solana-keys/validator-keypair.json \
    --trusted-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
    --trusted-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
    --trusted-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
    --trusted-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
    --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
    --snapshot-interval-slots 500 \
    --maximum-local-snapshot-age 500 \
    --rpc-port 8899 \
    --rpc-bind-address 0.0.0.0 \
    --full-rpc-api \
    --only-known-rpc \
    --dynamic-port-range 8000-8014 \
    --no-voting \
    --wal-recovery-mode skip_any_corrupted_record \
    --snapshot-archive-format lz4 \
    --no-wait-for-vote-to-start-leader \
    --limit-ledger-size 50000000 \
    --init-complete-file /var/root/data/init-completed \
    --accounts /mnt/accounts \
    --ledger /mnt/ledger \
    --log - \
    --no-poh-speed-test \
    --skip-poh-verify \
    --no-port-check
