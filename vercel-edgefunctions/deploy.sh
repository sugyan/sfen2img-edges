#!/bin/bash

set -eux

if ! command -v vercel &> /dev/null; then
    echo "vercel is not installed."
    exit 1
fi
if ! command -v wasm-pack &> /dev/null; then
    echo "wasm-pack is not installed."
    exit 1
fi

cd "$(dirname $(realpath "$0"))/../sfen2png-wasm"
wasm-pack build \
    --target web \
    --release \
    --out-dir ../vercel-edgefunctions/src/pkg \
    --out-name sfen2png

cd "$(dirname $(realpath "$0"))"
# vercel --prod
