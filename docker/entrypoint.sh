#!/bin/sh

set -e 

if [ "$1" = 'evmosd' ]; then
    evmosd init test-moniker --chain-id opti_9000-1 --home /root

    # Hack to get optimint config
    {
        echo
        echo '#######################################################'
        echo '###        Optimint                                 ###'
        echo '#######################################################'
        echo
        echo '[optimint]'
        echo '  aggregator = true'
        echo '  block_time = "30s"'
        echo '  namespace_id = "0000DEADBEEF0000"'
        echo '  da_layer = "grpc"'
        echo '  da_config = '"'"'{"host":"192.167.10.14", "port":4200}'"'"''
    } >> /root/config/config.toml

    exec "$@" "--"
fi

exec "$@"
