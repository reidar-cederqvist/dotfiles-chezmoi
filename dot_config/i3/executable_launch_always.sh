#!/bin/bash

w=$(find $HOME/.wallpapers/ -name *.jpg | sort -R | head -1)
wal -i $w
