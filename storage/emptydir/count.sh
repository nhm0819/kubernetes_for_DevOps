#!/bin/sh
trap "exit" SIGINT
mkdir /var/htdocs

SET=$(seq 0 999)
RANDOM=$$
for i in $SET

do
    echo "random integer :"$RANDOM > /var/htdocs/index.html
    sleep 2
done
