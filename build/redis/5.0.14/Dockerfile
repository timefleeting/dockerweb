ARG REDIS_VERSION
FROM redis:${REDIS_VERSION}

# set timezome
ARG TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone