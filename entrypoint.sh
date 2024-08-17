#!/bin/sh
set -e
rm -f /app/tmp/pids/server.pid
exec "$@"
if [ "${RAILS_ENV}" = "production" ]
then
    bundle exec rails assets:precompile
fi
