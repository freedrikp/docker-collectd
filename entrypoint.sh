#!/bin/bash

set -e

if [ -d /mnt/proc ]; then
  umount /proc
  mount -o bind /mnt/proc /proc
fi

if [ "$#" -eq 0 ]; then
  exec /opt/collectd/sbin/collectd -C /etc/collectd/collectd.conf -f
else
  exec "$@"
fi
