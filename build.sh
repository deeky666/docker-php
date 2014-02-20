#!/bin/bash

PHP_VERSION=$1
PHP_DIR=php-$PHP_VERSION

apt-get update -y
apt-get install -y wget tar bzip2 autoconf g++ make libxml2-dev
cd /opt && wget http://php.net/distributions/$PHP_DIR.tar.bz2
cd /opt && tar -xvjf $PHP_DIR.tar.bz2
mv /opt/$PHP_DIR.tar.bz2 /opt/php.tar.bz2
mv /opt/$PHP_DIR /opt/php
cd /opt/php && ./buildconf --force
cd /opt/php && ./configure \
 --with-libdir=lib/x86_64-linux-gnu \
 --with-config-file-path=/etc/php5/cli \
 --with-config-file-scan-dir=/etc/php5/conf.d \
 --disable-cgi \
 --disable-short-tags \
 --without-pear
cd /opt/php && make -j`nproc` && make install
mkdir -p /etc/php5/cli /etc/php5/conf.d
cp /tmp/php.ini /etc/php5/cli/php.ini
rm -rf /opt/php
apt-get purge -y wget bzip2 autoconf g++ make #tar
apt-get autoremove -y
apt-get clean -y
