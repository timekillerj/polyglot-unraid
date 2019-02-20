#!/bin/bash
set -e

mongod --bind_ip 127.0.0.1 &

# Wait for mongodb to come online.
echo -n "Waiting for mongodb to come online..."
while ! mongo --quiet --eval "{ ping: 1}" > /dev/null 2>&1; do
  sleep 2
  echo -n "."
done
echo " done."

/app/polyglot-v2-linux-x64
