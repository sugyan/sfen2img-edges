#!/bin/bash

set -eux

if ! command -v deno &> /dev/null; then
    echo "deno is not installed."
    exit 1
fi
if ! command -v wasm-pack &> /dev/null; then
    echo "wasm-pack is not installed."
    exit 1
fi

cd "$(dirname "$0")/../sfen2png-wasm"
wasm-pack build \
    --target deno \
    --release \
    --out-dir ../deno-deploy/pkg \
    --out-name sfen2png

cd "$(dirname "$0")"
deployctl deploy --prod server.ts
