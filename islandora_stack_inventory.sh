#!/bin/bash
# Islandora Stack Inventory - Web & Database Server
$stack_output = /tmp/stack_output.csv
$is_redhat = 0 #0 = no 1 = yes
$is_debian = 0 #0 = no 1 = yes

# Future development: Safeguard detection: Am I on an Islandora Server?
# Saves time and doesn't execute (to be developed at later date)

# Operating System
# First check if system is a RHEL / CENTOS release
if [ -f /etc/redhat-release ];
  then
    `cat /etc/redhat-release` > $stack_output
     $is_redhat = 1 #0 = no 1 = yes
     $php_ini = "/etc/php.ini"

# If not, then now check if system is a Debian / Ubuntu release
elif [[ -x /usr/bin/lsb_release ]];
  then
    `/usr/bin/lsb_release -r` > $stack_output
    $is_debian = 1 #0 = no 1 = yes
    $php_ini = ""
fi

# Hardware
cat /proc/cpuinfo | grep model_name
cat /proc/cpuinfo | grep cpu_cores

# Memory
# cat /proc /meminfo

# /usr/bin/free -m

# Software / Packages / Roles

# Basic Packages "Init"

# Webserver Roles
- env (environment_variables)
- mysql
- openjdk
- oracle_java
- apache

- php
# Check PHP version
echo "PHP information" >> $stack_output
echo "===============" >> $stack_output
echo "" >> $stack_output
php --version >> $stack_output
echo "" >> $stack_output
grep memory_limit $php_ini
grep upload_max_filesize $php_ini

- ghostscript
- imagemagick
- bibutils
- exif
- xpdf
- lame
- tesseract
- webdjatoka
- fits
- ffmpeg
- rvm_ruby
- composer_drush

# Islandora Stack Inventory - Fedora Server
- env (environment_variables)
- mysqlclient
- apache
- maven
- oracle_java
- tomcat
- fedora
- drupalfilter
- solr
- fedoragsearch
- djatoka
