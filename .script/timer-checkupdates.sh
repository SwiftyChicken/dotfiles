#!/bin/sh

file=/tmp/updates

echo "$(checkupdates | wc -l)" > $file
echo "$(yay -Qum | wc -l)" >> $file

exit 0
