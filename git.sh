#!/bin/sh

# author: Sun
# date: 2017/09/08
# version: 0.1
# http://blog.fixbug.net

# Install Git 2.15.0

echo '############## Install Git 2.15.0 Starting ##############'
echo '#                                                      #'
echo '#                    Author: Sun                       #'
echo '#                    Version: 0.1                      #'
echo '#                  Date: 2017/09/08                    #'
echo '#                http://blog.fixbug.net                #'
echo '#                                                      #'
echo '########################################################'

## start ##

if [ `whoami` != "root" ];then  
    echo 'yum: cannot yum: Permission denied'
    exit -1;
fi 

yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel \
gcc gcc-c++ perl-ExtUtils-MakeMaker

yum remove git

cd /usr/src
gitfile='git-2.15.0.tar.gz'
if [ ! -f $gitfile ];then
    wget --no-check-certificate https://www.kernel.org/pub/software/scm/git/$gitfile
fi
if [ -f $gitfile ];then
    tar -zxvf $gitfile
fi

cd git-2.15.0
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
source /etc/bashrc

## complete ##

echo '############## Install Git 2.15.0 End ##############'
echo '#                                                 #'
echo '#                                                 #'
echo '###################################################'
