#!/bin/bash

apt-get purge -y wget bzip2 autoconf g++ make #tar
apt-get autoremove -y
apt-get clean -y

