#!/bin/sh

Xvfb :1 -ac -screen 0 1024x768x16 &
/opt/ibc/gatewaystart.sh -inline