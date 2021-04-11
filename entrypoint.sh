#!/bin/bash
set -e

rm -f /triyo_api_core/tmp/pids/server.pid

exec "$@"