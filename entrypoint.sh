#!/bin/bash
set -e

rm -f /joblink/tmp/pids/server.pid

exec "$@"