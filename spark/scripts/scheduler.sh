#!/bin/sh

for i in {11..20}
#for i in 13 14
do
  echo 201512$i
  sh adcount.sh 201512$i
done
