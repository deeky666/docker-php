#!/bin/bash

PHP_VERSION=$1
PHP_DIR=php-$PHP_VERSION
LIB_DIR=$2

/tmp/build/install_build_deps.sh
cd /opt && wget http://php.net/distributions/$PHP_DIR.tar.bz2
cd /opt && tar -xvjf $PHP_DIR.tar.bz2
mv /opt/$PHP_DIR.tar.bz2 /opt/php.tar.bz2
mv /opt/$PHP_DIR /opt/php
cd /opt/php && ./buildconf --force
cd /opt/php && ./configure \
 --with-libdir=$LIB_DIR \
 --with-config-file-path=/etc/php5/cli \
 --with-config-file-scan-dir=/etc/php5/conf.d \
 --disable-cgi \
 --disable-short-tags \
 --without-pear
cd /opt/php && make -j`nproc` && make install
mkdir -p /etc/php5/cli /etc/php5/conf.d
cp /tmp/build/php.ini /etc/php5/cli/php.ini
/tmp/build/clean_build_deps.sh
rm -rf /opt/php /tmp/build

