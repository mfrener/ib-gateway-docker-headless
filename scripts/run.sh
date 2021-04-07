#!/bin/sh

rm -f /tmp/.X1-lock
Xvfb :1 -ac -screen 0 1024x768x16 &

/opt/ibc/scripts/ibcstart.sh "${TWS_MAJOR_VRSN}" -g \
     "--tws-path=${TWS_PATH}" \
     "--ibc-path=${IBC_PATH}" "--ibc-ini=${IBC_INI}" \
     "--user=${TWSUSERID}" "--pw=${TWSPASSWORD}" "--mode=${TRADING_MODE}" \
     "--on2fatimeout=${TWOFA_TIMEOUT_ACTION}" &

sleep 30
echo "Forking :::4001 onto 0.0.0.0:4003"
socat TCP-LISTEN:4003,fork TCP:127.0.0.1:4001 &
echo "Forking :::4002 onto 0.0.0.0:4004"
socat TCP-LISTEN:4004,fork TCP:127.0.0.1:4002