#!/bin/bash

source /root/.bashrc

Xvfb :99 -ac -screen 0 1280x720x16 -nolisten tcp &

exec "$@"
