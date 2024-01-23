#!/bin/bash

set -eux

for file in "$(dirname $(realpath "$0"))"/*/deploy.sh; do
    "${file}"
done
