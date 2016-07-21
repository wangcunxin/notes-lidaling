#!/bin/bash
ps -aux|grep 1099|grep -v grep|tr -s " "|cut -d" " -f2|xargs kill -9
