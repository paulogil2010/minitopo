#!/usr/bin/python

import time
import subprocess
from datetime import datetime

HOUR = datetime.now()

class Handover():
    def shut_down(self):
        down_time = HOUR.strftime("%H:%M:%S")
        print()
        print(down_time)
        subprocess.run(
            "ifconfig Client-eth0 down; echo `date  +'%H:%M:%S'` - $? > ./up-down-int.txt",
            shell=True
        )

    def turn_on(self):
        up_time = HOUR.strftime("%H:%M:%S")
        print()
        print(up_time)
        subprocess.run(
            "ifconfig Client-eth0 up; echo `date  +'%H:%M:%S'` - $? >> ./up-down-int.txt",
            shell=True
        )

    def run(self):
        time.sleep(3)
        self.shut_down()
        time.sleep(10)
        self.turn_on()

teste = Handover()
teste.run()