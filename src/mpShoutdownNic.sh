#!/usr/bin/bash

shutdown () {
    HOUR=$(date +%H:%M:%S)
    ifconfig Client-eth1 down >> ./up-down-int.txt
    output=$?
    echo "$HOUR : $output" >> ./up-down-int.txt
}

turn_on () {
    HOUR=$(date +%H:%M:%S)
    ifconfig Client-eth1 up >> ./up-down-int.txt
    output=$?
    echo "$HOUR : $output" >> ./up-down-int.txt
}

run () {
    ifconfig Client-eth1
    output=$?
    if [output == 1]; then
        sleep 10
        shutdown
        sleep 15
        turn_on
    fi
}

run
