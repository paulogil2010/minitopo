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
    echo "SATANAS"
    sleep 30
    shutdown
    sleep 30
    turn_on
}

run
