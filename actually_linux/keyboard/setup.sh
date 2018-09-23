#/bin/bash

## must be run as su

# change this file to 2 to get function keys to be function keys
echo 2 >/sys/module/hid_apple/parameters/fnmode

## must be run in user space

# this gets things close to what I want, but they don't work in the terminal
setxkbmap us -variant colemak \
  -option ctrl:nocaps \
  -option shift:both_capslock

# xcape stuff to get the tap keys I like
xcape -e 'Control_L=Escape'
xcape -e 'Shift_L=parenleft;Shift_R=parenright'