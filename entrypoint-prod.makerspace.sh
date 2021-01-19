#!/bin/sh
set -e
cd /usr/src/app
rm -f /usr/src/app/tmp/pids/server.pid
bundle exec whenever --update-crontab
/usr/sbin/cron
rails assets:precompile
bin/setup
exec "$@"
