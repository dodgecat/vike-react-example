#!/bin/sh
set -eo pipefail

echo "exec client."
export PORT=8080
envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;' &

# Exit immediately when one of the background processes terminate.
echo "wait."

wait -n
