#!/bin/sh

if [ -f tmp/pids/server.pid ]; then rm tmp/pids/server.pid; fi
#if [ -f tmp/sockets/puma.sock ]; then rm tmp/sockets/puma.sock; fi
bundle exec rails s Puma -e $RAILS_ENV
