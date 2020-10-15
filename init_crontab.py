from crontab import CronTab
from subprocess import call
import os 

cron = CronTab(user='root')
job = cron.new(
    command=(
        'cd /usr/src/app && /usr/local/bin/python main.py >> /proc/1/fd/1 2>&1'))
job.setall('*/1 * * * *')
cron.env['test_env'] = os.getenv("test_env", 0)
cron.env['TZ'] = os.getenv("TZ", "UTC")
cron.write()
