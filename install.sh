#!/bin/bash

echo "########################################################################################"
echo "Staring Polyglot Install ......"
echo "Updating System and installing MongoDB, git, python3, curl and relevant dependencies"
$SUDO apt-get -qy update
$SUDO apt-get -qqy install mongodb-server git python3-pip python3-dev python2.7-dev python-pip curl
echo "########################################################################################"
echo "Moving to polyglot directory ......"
[ ! -d /app ] && mkdir /app
cd /app
file_string="polyglot-v2-linux-x64"
echo "Getting $file_string from S3"
wget -q https://s3.amazonaws.com/polyglotv2/binaries/$file_string.tar.gz
echo "Extracting $file_string.tar.gz..."
tar -zxf $file_string.tar.gz
echo "Complete..."

cd ..
hostip=$(hostname -I | awk '{print $1}')
hostport="3000"
echo "###################################################################################"
echo "DONE! Login to Polyglot v2 at https://$hostip:$hostport"
echo "Username: admin"
echo "Password: admin"
echo "Be patient. It may take up to three minutes for the interface to be available while"
echo "MongoDB and Polyglot start up for the first time."
echo "###################################################################################"
