from crontab import CronTab
cron = CronTab(user='root')
job = cron.new(
    command=(
        ' /usr/local/bin/python -m src.main >> '
        '/proc/1/fd/1 2>&1'))
job.setall('0 0 * * *')
cron.write()
