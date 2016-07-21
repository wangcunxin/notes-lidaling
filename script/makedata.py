__author__ = 'Administrator'

import datetime

import os
import time

class ShellUtil:
    @staticmethod
    def callShell(shell_command=''):
        os.system(shell_command)
        time.sleep(1)


if __name__=='__main__':
    start_day='2014-07-01'

    current_day=datetime.datetime.strptime(start_day,'%Y-%m-%d')
    now_day=datetime.datetime.now()
    now_day=now_day.replace(hour=0,minute=0,second=0,microsecond=0)



    while True:
        new_day=current_day+datetime.timedelta(days=1)
        current_day=new_day
        if now_day>current_day:
            dest_time_str=new_day.strftime("%Y-%m-%d")
            #dayHandler.handle(dest_time_str)
            #ShellUtil.callShell("rm -rf /home/hadoop/destFile/*")
            print('start--------------'+dest_time_str+'------------------data')
            ShellUtil.callShell('sh /opt/mysqlmakedata.sh '+dest_time_str)
            time.sleep(1)
            print('end--------------'+dest_time_str+'------------------data')
            #print(dest_time_str)
            #logger.info('main:---'+dest_time_str+' handle start...')
        else:
            break
