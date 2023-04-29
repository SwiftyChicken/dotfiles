#!/bin/bash

usage() { echo "Usage: $0 [-c] <volume|brightness>" 1>&2; exit 1; }
check() { [ "$1" == "volume" ] || [ "$1" == "brightness" ] || usage; }

while getopts ":c:" opt; do
    case "${opt}" in
	c)  check "${OPTARG}"
	    script_name=${BASH_SOURCE[0]}

	    for pid in $(pidof -x $script_name); do 
		[ $pid != $$ ] && kill -9 $pid
	    done

	    eww update ${OPTARG}_reveal=false

	    exit 0
            ;;
        *)
            usage
	    exit 0
            ;;
    esac
done

shift $((OPTIND-1))

check "$@"

eww update ${1}_reveal=true
sleep 5
eww update ${1}_reveal=false
