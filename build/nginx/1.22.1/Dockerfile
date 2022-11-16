ARG NGINX_VERSION
FROM nginx:${NGINX_VERSION}

# set timezome
ARG TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG WWWHTML
WORKDIR ${WWWHTML}