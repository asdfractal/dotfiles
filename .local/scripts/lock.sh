#!/usr/bin/env bash

set -e
i3lock --nofork --ignore-empty-password --tiling --image='~/Pictures/wallpaper.png'
xset dpms 0 0 0
