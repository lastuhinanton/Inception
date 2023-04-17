#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

tempVar=$(curl http://51.250.10.154/test/ 2>/dev/null | grep 'It is the test page!')
if [[ "$tempVar" ]] ; then
    printf "nginx is ${GREEN}RUNNING${NC}\n"
else
    printf "nginx is ${RED}NOT RUNNING${NC}\n"
fi
