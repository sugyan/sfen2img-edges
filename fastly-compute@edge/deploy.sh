#!/bin/bash

set -eux

if ! command -v fastly &> /dev/null; then
    echo "fastly is not installed."
    exit 1
fi

cd "$(dirname "$0")"
fastly compute publish
