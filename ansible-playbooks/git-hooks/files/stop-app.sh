#! /bin/bash

pid=$(netstat -ntpl | grep :4000 | awk '{print $7}' | cut -d '/' -f 1)
kill -9 $pid
