#!/bin/sh
set -e
cd /usr/src/app
rm -f /usr/src/app/tmp/pids/server.pid
mkdir -p /tmp/unicorn
bin/setup
bundle exec whenever --update-crontab
/usr/sbin/cron
rails assets:precompile
exec "$@"
