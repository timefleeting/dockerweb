#!/bin/sh


if [ "${PHP_EXTENSIONS}" != "" ]; then
    echo "---------- Install general dependencies ----------"
    apk add --no-cache autoconf g++ libtool make curl-dev libxml2-dev linux-headers
fi

if [ -z "${EXTENSIONS##*,pdo_mysql,*}" ]; then
    echo "---------- Install pdo_mysql ----------"
    docker-php-ext-install ${MC} pdo_mysql
fi

if [ -z "${EXTENSIONS##*,zip,*}" ]; then
    echo "---------- Install zip ----------"
	docker-php-ext-install ${MC} zip
fi

if [ -z "${EXTENSIONS##*,pcntl,*}" ]; then
    echo "---------- Install pcntl ----------"
	docker-php-ext-install ${MC} pcntl
fi

if [ -z "${EXTENSIONS##*,mysqli,*}" ]; then
    echo "---------- Install mysqli ----------"
	docker-php-ext-install ${MC} mysqli
fi

if [ -z "${EXTENSIONS##*,mbstring,*}" ]; then
    echo "---------- Install mbstring ----------"
	docker-php-ext-install ${MC} mbstring
fi

if [ -z "${EXTENSIONS##*,exif,*}" ]; then
    echo "---------- Install exif ----------"
	docker-php-ext-install ${MC} exif
fi

if [ -z "${EXTENSIONS##*,bcmath,*}" ]; then
    echo "---------- Install bcmath ----------"
	docker-php-ext-install ${MC} bcmath
fi

if [ -z "${EXTENSIONS##*,calendar,*}" ]; then
    echo "---------- Install calendar ----------"
	docker-php-ext-install ${MC} calendar
fi

if [ -z "${EXTENSIONS##*,zend_test,*}" ]; then
    echo "---------- Install zend_test ----------"
	docker-php-ext-install ${MC} zend_test
fi

if [ -z "${EXTENSIONS##*,opcache,*}" ]; then
    echo "---------- Install opcache ----------"
    docker-php-ext-install opcache
fi

if [ -z "${EXTENSIONS##*,sockets,*}" ]; then
    echo "---------- Install sockets ----------"
	docker-php-ext-install ${MC} sockets
fi

if [ -z "${EXTENSIONS##*,gettext,*}" ]; then
    echo "---------- Install gettext ----------"
	docker-php-ext-install ${MC} gettext
fi

if [ -z "${EXTENSIONS##*,shmop,*}" ]; then
    echo "---------- Install shmop ----------"
	docker-php-ext-install ${MC} shmop
fi

if [ -z "${EXTENSIONS##*,sysvmsg,*}" ]; then
    echo "---------- Install sysvmsg ----------"
	docker-php-ext-install ${MC} sysvmsg
fi

if [ -z "${EXTENSIONS##*,sysvsem,*}" ]; then
    echo "---------- Install sysvsem ----------"
	docker-php-ext-install ${MC} sysvsem
fi

if [ -z "${EXTENSIONS##*,sysvshm,*}" ]; then
    echo "---------- Install sysvshm ----------"
	docker-php-ext-install ${MC} sysvshm
fi

if [ -z "${EXTENSIONS##*,pdo_firebird,*}" ]; then
    echo "---------- Install pdo_firebird ----------"
	docker-php-ext-install ${MC} pdo_firebird
fi

if [ -z "${EXTENSIONS##*,pdo_dblib,*}" ]; then
    echo "---------- Install pdo_dblib ----------"
	docker-php-ext-install ${MC} pdo_dblib
fi

if [ -z "${EXTENSIONS##*,pdo_oci,*}" ]; then
    echo "---------- Install pdo_oci ----------"
	docker-php-ext-install ${MC} pdo_oci
fi

if [ -z "${EXTENSIONS##*,pdo_odbc,*}" ]; then
    echo "---------- Install pdo_odbc ----------"
	docker-php-ext-install ${MC} pdo_odbc
fi

if [ -z "${EXTENSIONS##*,pdo_pgsql,*}" ]; then
    echo "---------- Install pdo_pgsql ----------"
    apk --no-cache add postgresql-dev \
    && docker-php-ext-install ${MC} pdo_pgsql
fi

if [ -z "${EXTENSIONS##*,pgsql,*}" ]; then
    echo "---------- Install pgsql ----------"
    apk --no-cache add postgresql-dev \
    && docker-php-ext-install ${MC} pgsql
fi

if [ -z "${EXTENSIONS##*,oci8,*}" ]; then
    echo "---------- Install oci8 ----------"
	docker-php-ext-install ${MC} oci8
fi

if [ -z "${EXTENSIONS##*,odbc,*}" ]; then
    echo "---------- Install odbc ----------"
	docker-php-ext-install ${MC} odbc
fi

if [ -z "${EXTENSIONS##*,dba,*}" ]; then
    echo "---------- Install dba ----------"
	docker-php-ext-install ${MC} dba
fi

if [ -z "${EXTENSIONS##*,interbase,*}" ]; then
    echo "---------- Install interbase ----------"
    echo "Alpine linux do not support interbase/firebird!!!"
	#docker-php-ext-install ${MC} interbase
fi

if [ -z "${EXTENSIONS##*,gd,*}" ]; then
    echo "---------- Install gd ----------"
    apk add --no-cache freetype-dev libjpeg-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install ${MC} gd
fi

if [ -z "${EXTENSIONS##*,intl,*}" ]; then
    echo "---------- Install intl ----------"
    apk add --no-cache icu-dev
    docker-php-ext-install ${MC} intl
fi

if [ -z "${EXTENSIONS##*,bz2,*}" ]; then
    echo "---------- Install bz2 ----------"
    apk add --no-cache bzip2-dev
    docker-php-ext-install ${MC} bz2
fi

if [ -z "${EXTENSIONS##*,soap,*}" ]; then
    echo "---------- Install soap ----------"
	docker-php-ext-install ${MC} soap
fi

if [ -z "${EXTENSIONS##*,xsl,*}" ]; then
    echo "---------- Install xsl ----------"
	apk add --no-cache libxslt-dev
	docker-php-ext-install ${MC} xsl
fi

if [ -z "${EXTENSIONS##*,xmlrpc,*}" ]; then
    echo "---------- Install xmlrpc ----------"
	apk add --no-cache libxslt-dev
	docker-php-ext-install ${MC} xmlrpc
fi

if [ -z "${EXTENSIONS##*,wddx,*}" ]; then
    echo "---------- Install wddx ----------"
	apk add --no-cache libxslt-dev
	docker-php-ext-install ${MC} wddx
fi

if [ -z "${EXTENSIONS##*,curl,*}" ]; then
    echo "---------- Install curl ----------"
	docker-php-ext-install ${MC} curl
fi

if [ -z "${EXTENSIONS##*,readline,*}" ]; then
    echo "---------- Install readline ----------"
	apk add --no-cache readline-dev
	apk add --no-cache libedit-dev
	docker-php-ext-install ${MC} readline
fi

if [ -z "${EXTENSIONS##*,snmp,*}" ]; then
    echo "---------- Install snmp ----------"
	apk add --no-cache net-snmp-dev
	docker-php-ext-install ${MC} snmp
fi

if [ -z "${EXTENSIONS##*,pspell,*}" ]; then
    echo "---------- Install pspell ----------"
	apk add --no-cache aspell-dev
	apk add --no-cache aspell-en
	docker-php-ext-install ${MC} pspell
fi

if [ -z "${EXTENSIONS##*,recode,*}" ]; then
    echo "---------- Install recode ----------"
	apk add --no-cache recode-dev
	docker-php-ext-install ${MC} recode
fi

if [ -z "${EXTENSIONS##*,gmp,*}" ]; then
    echo "---------- Install gmp ----------"
	apk add --no-cache gmp-dev
	docker-php-ext-install ${MC} gmp
fi

if [ -z "${EXTENSIONS##*,imap,*}" ]; then
    echo "---------- Install imap ----------"
	apk add --no-cache imap-dev
    docker-php-ext-configure imap --with-imap --with-imap-ssl
	docker-php-ext-install ${MC} imap
fi

if [ -z "${EXTENSIONS##*,ldap,*}" ]; then
    echo "---------- Install ldap ----------"
	apk add --no-cache ldb-dev
	apk add --no-cache openldap-dev
	docker-php-ext-install ${MC} ldap
fi

if [ -z "${EXTENSIONS##*,imagick,*}" ]; then
    echo "---------- Install imagick ----------"
	apk add --no-cache file-dev
	apk add --no-cache imagemagick-dev
    printf "\n" | pecl install imagick-3.4.4
    docker-php-ext-enable imagick
fi

if [ -z "${EXTENSIONS##*,amqp,*}" ]; then
    echo "---------- Install amqp ----------"
    apk add --no-cache rabbitmq-c-dev
    pecl install amqp-1.9.4.tgz
    docker-php-ext-enable amqp
fi

if [ -z "${EXTENSIONS##*,redis,*}" ]; then
    echo "---------- Install redis ----------"
    printf "\n" | pecl install redis-5.1.1
    docker-php-ext-enable redis
fi

if [ -z "${EXTENSIONS##*,memcached,*}" ]; then
    echo "---------- Install memcached ----------"
	apk add --no-cache libmemcached-dev zlib-dev
    printf "\n" | pecl install memcached-3.1.3
    docker-php-ext-enable memcached
fi

if [ -z "${EXTENSIONS##*,swoole,*}" ]; then
    echo "---------- Install swoole ----------"
    printf "\n" | pecl install swoole-4.8.11.tgz
    docker-php-ext-enable swoole
fi

if [ -z "${EXTENSIONS##*,xdebug,*}" ]; then
    echo "---------- Install xdebug ----------"
    printf "\n" | pecl install xdebug
    docker-php-ext-enable xdebug
fi

if [ -z "${EXTENSIONS##*,mongodb,*}" ]; then
    echo "---------- Install mongodb ----------"
    pecl install mongodb
    docker-php-ext-enable mongodb
fi

if [ -z "${EXTENSIONS##*,mcrypt,*}" ]; then
    echo "---------- mcrypt was REMOVED from PHP 7.1.0 ----------"
fi

if [ -z "${EXTENSIONS##*,mysql,*}" ]; then
    echo "---------- mysql was REMOVED from PHP 7.0.0 ----------"
fi

if [ -z "${EXTENSIONS##*,sodium,*}" ]; then
    echo "---------- Install sodium ----------"
    echo "Sodium is bundled with PHP from PHP 7.1.0 "
fi

if [ -z "${EXTENSIONS##*,pdo_sqlsrv,*}" ]; then
    echo "---------- Install pdo_sqlsrv ----------"
	apk add --no-cache unixodbc-dev
    pecl install pdo_sqlsrv
    docker-php-ext-enable pdo_sqlsrv
fi

if [ -z "${EXTENSIONS##*,sqlsrv,*}" ]; then
    echo "---------- Install sqlsrv ----------"
	apk add --no-cache unixodbc-dev
    printf "\n" | pecl install sqlsrv
    docker-php-ext-enable sqlsrv
fi

if [ -z "${EXTENSIONS##*,yaf,*}" ]; then
    echo "---------- Install yaf ----------"
    pecl install yaf
    docker-php-ext-enable yaf
fi


