#!/bin/bash

cd webserv/

sysctl -w net.inet.tcp.msl=100

tail -f /dev/null
