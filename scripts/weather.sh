#!/bin/bash

curl -s 'https://wttr.in/Richmond+Hill?$0' | grep -vE '^Weather'
printf "\n"
