ARG PHP_VERSION
ARG PHP_VERSION_FPM
FROM php:${PHP_VERSION}${PHP_VERSION_FPM}

# set timezome
ARG TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#php extensions
ARG PHP_EXTENSIONS
ENV EXTENSIONS=",${PHP_EXTENSIONS},"
ENV MC="-j$(nproc)"
COPY ./extensions /tmp/extensions
WORKDIR /tmp/extensions
RUN export MC="-j$(nproc)" \
    && chmod +x install.sh \
    && sh install.sh \
    && rm -rf /tmp/extensions

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ARG WWWHTML
WORKDIR ${WWWHTML}