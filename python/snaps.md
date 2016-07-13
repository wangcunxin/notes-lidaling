
Advanced Python Scheduler (APScheduler) is a light but powerful in-process task scheduler that lets you schedule functions (or any other python callables) to be executed at times of your choosing.

example:

```

from apscheduler.schedulers.blocking import BlockingScheduler
import datetime

def dateStr(date=None,format=''):
    return date.strftime(format)

sched=BlockingScheduler()
# every 3 second in every minute
@sched.scheduled_job('cron', second='20-40/3')
def schedulerTest():
    print("scheduler test before")
    print dateStr(datetime.datetime.now(),'%Y-%m-%d %H:%M:%S')
    time.sleep(10)
    print("scheduler test after")

if __name__ == '__main__':
    sched.start()
    sched.shutdown(wait=True)

```


- datetime:

        if (x.ArrivalTime-x.DepartureTime).total_seconds() > 3600*24 :

- string or number format

    ref :http://stackoverflow.com/questions/339007/nicest-way-to-pad-zeroes-to-string

    ```
    >>> n = '4'
    >>> print n.zfill(3)
    >>> '004'
    And for numbers:

    >>> n = 4
    >>> print '%03d' % n
    >>> 004
    >>> print format(4, '03') # python >= 2.6
    >>> 004
    >>> print '{0:03d}'.format(4)  # python >= 2.6
    >>> 004
    >>> print('{0:03d}'.format(4))  # python 3
    >>> 004
    ```
