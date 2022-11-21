ARG MYSQL_VERSION
FROM mysql:${MYSQL_VERSION}

# set timezome
ARG TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# mysql backup scripts using crontab
# COPY ./scripts/ /data/mysql/backup/scripts/
# RUN crontab /data/mysql/backup/scripts/crontabfile
# RUN service cron start