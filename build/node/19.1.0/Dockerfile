ARG NODE_VERSION
FROM node:${NODE_VERSION}

# set timezome
ARG TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone