#!/bin/sh

if ! [ -d "$RSENSE_HOME" ];
then
    echo "RSENSE_HOME undefined."
    exit 1
fi

`ruby ${RSENSE_HOME}/etc/config.rb > ~/.rsense`

if [ $? -eq 0 ];
then
    echo "success."
else
    echo "failed."
fi


