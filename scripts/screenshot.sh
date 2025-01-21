#!/bin/sh
scrot --select -f -l width=3 - | xclip -selection clipboard -target image/png
