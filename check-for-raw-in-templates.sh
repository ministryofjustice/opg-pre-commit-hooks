#!/usr/bin/env bash

while getopts d:c: option
do
case "${option}"
in
d) DIRECTORY=${OPTARG};;
c) ALLOWED_COUNT=${OPTARG};;
\?) echo "Usage: cmd [-d] [-c]";;
esac
done

if [ `grep -r '|.*raw' ${DIRECTORY}/* | wc -l` -gt ${ALLOWED_COUNT} ]
then
  echo "Instances of raw in ${DIRECTORY}. Please remove"
  exit 1
else
  exit 0
fi
