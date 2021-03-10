#!/usr/bin/env bash

find / -iname "*.so" \
       -user mamede  \
       -type f       \
       -size +1M     \
       -exec ls {}   \;