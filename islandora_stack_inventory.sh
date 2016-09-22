#!/bin/bash
# Islandora Stack Inventory - Web & Database Server
stack_output="/tmp/stack_output.csv"
is_redhat=0 #0 = no 1 = yes
is_debian=0 #0 = no 1 = yes

# Future development: Safeguard detection: Am I on an Islandora Server?
# Saves time and doesn't execute (to be developed at later date)

# Operating System
# First check if system is a RHEL / CENTOS release
if [ -f /etc/redhat-release ];
  then
    #`cat /etc/redhat-release` > $stack_output
     echo `cat /etc/redhat-release`
     is_redhat=1 #0 = no 1 = yes
     #
     # Specify OS variables
     #
     php_ini="/etc/php.ini"
     package_query=`rpm -qa`
fi
# If not, then now check if system is a Debian / Ubuntu release
if  [ -f /usr/bin/lsb_release ];
   then
     #`/usr/bin/lsb_release -r` > $stack_output
     echo `/usr/bin/lsb_release -r`
     is_debian=1 #0 = no 1 = yes
     #
     # Specify OS variables
     #
     php_ini="/etc/php5/apache2/php.ini"
     package_query=`dpkg -l`
fi

#if [ ! is_redhat | ! is_debian ]
#    then
#	echo "operating system is not known"
#	echo "rhel or debian not found.. exiting"
#	exit 1
#fi

#if [ $is_redhat] then

#fi

#if [ $is_redhat] then

#fi
# Hardware
cat /proc/cpuinfo | grep model\ name
cat /proc/cpuinfo | grep cpu\ cores

# Memory
# cat /proc /meminfo

# /usr/bin/free -m

# Software / Packages / Roles

# Basic Packages "Init"

# Webserver Roles
##- env (environment_variables)
#
##- mysql
#
echo "MySQL information" >> $stack_output
echo "=================" >> $stack_output
echo "" >> $stack_output
mysql --version >> $stack_output
echo "" >> $stack_output

##- openjdk
##- oracle_java
##- apache

#
##- php
#
echo "PHP information" >> $stack_output
echo "===============" >> $stack_output
echo "" >> $stack_output
php --version >> $stack_output
echo "" >> $stack_output
grep memory_limit $php_ini
grep upload_max_filesize $php_ini
echo "" >> $stack_output

#
##- ghostscript
#
echo "Ghostscript information" >> $stack_output
echo "=======================" >> $stack_output
echo "" >> $stack_output
gs --version >> $stack_output
echo "" >> $stack_output
#
##- imagemagick
#
echo "ImageMagick information" >> $stack_output
echo "=======================" >> $stack_output
echo "" >> $stack_output
$package_query | grep ImageMagick >> $stack_output
echo "" >> $stack_output

##- bibutils
##- exif
##- xpdf
##- lame
##- tesseract
##- webdjatoka
##- fits
##- ffmpeg
##- rvm_ruby
##- composer_drush

# Islandora Stack Inventory - Fedora Server
##- env (environment_variables)
##- mysqlclient
##- apache
##- maven
##- oracle_java
##- tomcat
##- fedora
##- drupalfilter
##- solr
##- fedoragsearch
##- djatoka
