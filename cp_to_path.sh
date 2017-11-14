#!/bin/bash

if [ $USER != "root" ]
then
	echo "This script must be run as root"
	exit
fi

cp ${PWD}/DockerRunScripts/* /usr/bin/
