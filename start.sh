#!/bin/bash

set -e

exec /usr/bin/minidlna -d -f /etc/minidlna.conf $@
