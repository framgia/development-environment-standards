#!/bin/bash
set -e

if [ "$RAILS_ENV" != "" ] && [ "$RAILS_ENV" != "development" ] && [ "$RAILS_ENV" != "test" ]
then
  # Start crontab service
  service cron start

  # Update crontab list
  whenever --set "environment=$RAILS_ENV" --update-crontab
fi

if [ "$RAILS_ENV" == "development" ]
then
  bundle exec spring binstub --all
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
