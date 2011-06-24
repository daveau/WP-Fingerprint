#!/bin/sh

exec 4<./wp-plugins.lst.2
ID=420001
while read NAME CRAP <&4
do
	echo "\"${ID}\",\"0\",\"01234567890abc\",\"/wp-content/plugins/${NAME}/readme.txt\",\"GET\",\"200\",\"\",\"\",\"\",\"\",\"[WordPress] Plugin found: ${NAME}\",\"\",\"\""
	ID=`expr $ID + 1`
done

