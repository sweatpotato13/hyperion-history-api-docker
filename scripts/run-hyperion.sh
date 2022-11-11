#!/bin/sh

_term() {
  kill -TERM "$child" 2>/dev/null
  pm2 stop "$app_name"
}

trap _term SIGTERM

echo $1
echo $2

pm2 start --only $2 --update-env
pm2 logs --raw &

app_name=$2

child=$!
wait "$child"
