#!/bin/bash

set -eux

if ! command -v wrangler &> /dev/null; then
    echo "wrangler is not installed."
    exit 1
fi

cd "$(dirname $(realpath "$0"))"
wrangler deploy
