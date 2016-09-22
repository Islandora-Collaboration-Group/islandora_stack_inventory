#!/bin/bash
# Islandora Stack Inventory - Web & Database Server
stack_output="/tmp/stack_output.txt"
is_redhat=0 #0 = no 1 = yes
is_debian=0 #0 = no 1 = yes

# Future development: Safeguard detection: Am I on an Islandora Server?
# Saves time and doesn't execute (to be developed at later date)

# Operating System
# First check if system is a RHEL / CENTOS release
if [ -e /etc/redhat-release ];
  then
    #`cat /etc/redhat-release` > $stack_output
     echo `cat /etc/redhat-release`
     is_redhat=1 #0 = no 1 = yes
     #
     # Specify OS variables
     #
     php_ini="/etc/php.ini"
     package_query="rpm -qa"
fi
# If not, then now check if system is a Debian / Ubuntu release
if  [ -e /usr/bin/lsb_release ];
   then
     #`/usr/bin/lsb_release -r` > $stack_output
     echo `/usr/bin/lsb_release -r`
     is_debian=1 #0 = no 1 = yes
     #
     # Specify OS variables
     #
     php_ini="/etc/php5/apache2/php.ini"
     package_query="dpkg -l"
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

# Initialize file
echo "Islandora Stack Inventory" > $stack_output
echo "=========================" >> $stack_output
echo " " >> $stack_output
echo " " >> $stack_output
# Hardware
cat /proc/cpuinfo | grep model\ name >> $stack_output
cat /proc/cpuinfo | grep cpu\ cores >> $stack_output

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
echo "" >> $stack_output
echo "" >> $stack_output
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
echo "" >> $stack_output
echo "" >> $stack_output
echo "PHP information" >> $stack_output
echo "===============" >> $stack_output
echo "" >> $stack_output
php --version >> $stack_output
echo "" >> $stack_output
grep memory_limit $php_ini >> $stack_output
grep upload_max_filesize $php_ini >> $stack_output
echo "" >> $stack_output

#
##- ghostscript
#
echo "" >> $stack_output
echo "" >> $stack_output
echo "Ghostscript information" >> $stack_output
echo "=======================" >> $stack_output
echo "" >> $stack_output
gs --version >> $stack_output
echo "" >> $stack_output
#
##- imagemagick
#
echo "" >> $stack_output
echo "" >> $stack_output
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

cat $stack_output
