#!/usr/bin/bash

shutdown () {
    HOUR=$(date +%H:%M:%S)
    command=$(ifconfig Client-eth0 down)
    echo "$HOUR : $command" > ./up-down-int.txt
}

turn_on () {
    HOUR=$(date +%H:%M:%S)
    command=$(ifconfig Client-eth0 up)
    echo "$HOUR : $command" >> ./up-down-int.txt
}

run () {
    echo "SATANAS"
    sleep 3
    shutdown
    sleep 3
    turn_on
}