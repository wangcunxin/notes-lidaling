#!/bin/bash
. ./config.properties
DESTFILE=$destDir"$2"
echo $DESTFILE

IFS=''
echo -n "input TITLE:"
read TITLE
echo -n "input CATEGORIES:"
read CATEGORIES
echo -n "input TAG:"
read TAG

echo -n "------"
echo -n ""
echo -n "TITLE is:"$TITLE"\nCATEGORIES is:"$CATEGORIES"\nTAG is:"$TAG
echo -n "------"
echo -n "\n"
echo -n "IS IT RIGHT?\n"
read ANS
case $ANS in
	y|Y|Yes|yes)
		cp $1 $DESTFILE
		sed '1i ---\nlayout: post\ntitle:'$TITLE'\ncategories:\n- '$CATEGORIES'\ntags:\n- '$TAG'\n---\n' -i $DESTFILE
		;;
	n|N|No|no)
		echo "roll back"
		;;
	*)
		echo "inavliable answer:"$ANS
esac
