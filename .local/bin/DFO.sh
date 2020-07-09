###########################################################
#              DOWNLOADS FOLDER OBSERVER                  #
###########################################################
#!/bin/sh

# Prevent termination at startup
sleep 3

# Replace if already running
running=$(pidof -x $0)
echo "$running $0"

while [ "$(echo $running | wc -w)" -gt "2" ]; do
	
	oldprocess=$(echo $running| rev| cut -d' ' -f1| rev)
	
	kill $oldprocess
	sleep 1
	
	running=$(pidof -x $0)
	
	dunstify -r "991059" "Script" "DFO.sh has been reloaded"

done

# Watch if new file is added to ~/Downloads and organise it.
inotifywait -m "$HOME/Downloads" -e moved_to | while read dir action file; do
	    sleep 1
	    organise.sh
    done
