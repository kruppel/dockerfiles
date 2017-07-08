#!/usr/bin/env bash

set -e

function run_metastore() {
    cd /opt/hive/bin && ./hive-config.sh && ./hive --service metastore
}

if [[ "$1" == "metastore" ]]; then
    ./setup-hive.sh
    run_metastore
else
    exec "$@"
fi
