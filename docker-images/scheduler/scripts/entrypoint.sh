#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Setup a cron schedule
echo "* * * * * cd /var/www/html/sugarcrm; /usr/local/bin/php -f cron.php >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
rm scheduler.txt
cron -f