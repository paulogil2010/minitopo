#!/usr/bin/python

import time
import subprocess
import datetime

HOUR = datetime.now()

def shut_down():
    down_time = HOUR.strftime("%H:%M:%S")
    subprocess.run(
        'ifconfig Client-eth0 down; echo $begin - $1 > up-down-int.txt',
        shell=True
    )

def turn_on():
    up_time = HOUR.strftime("%H:%M:%S")
    subprocess.run(
        'ifconfig Client-eth0 up; echo $up_time - $1 >> up-down-int.txt',
        shell=True
    )

def run():
    time.sleep(30)
    shut_down()
    time.sleep(30)
    turn_on()

