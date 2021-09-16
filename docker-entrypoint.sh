#!/bin/sh
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install --jobs=9 --retry=3
bundle exec rake assets:precompile

bundle exec rails db:prepare

bundle exec rails s -b 0.0.0.0