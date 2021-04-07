# ib-gateway-docker-headless

IB Gateway + IbcAlpha + Xvfb on a Docker Container.

Run like:
```
docker container run --env TWSUSERID='YOUR_IB_ACCOUNT' --env TWSPASSWORD="YOUR_IB_PASSWORD" --env TRADING_MODE=paper ibgateway:latest
```