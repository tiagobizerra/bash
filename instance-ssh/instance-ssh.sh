#!/bin/bash

# Check for aws tools

# Map regions

# Variables
OUTPUT=text
DEFAULT_USER=ec2-user

PUBLICDNS=`aws ec2 describe-instances --instance-id $1 --output $OUTPUT | grep ASSOCIATION | awk '{print $3}' | uniq`

# if no $2 present use $DEFAULT_USER

if [ $# -eq 1 ];
	then
		echo "Connecting to instance "$1" "
		ssh $PUBLICDNS -l $DEFAULT_USER
	else 
		echo "Wrong arguments"
		echo "Usage: ssh-instance 'instance-id'"
fi
