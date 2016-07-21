#!/bin/sh
# ref https://bash.cyberciti.biz/guide/The_case_statement
if [ -z $1 ]
then
  server="*** Unknown parameter ***"
  exit
elif [ -n $1 ]
then
  openssl rand -hex $1
fi

