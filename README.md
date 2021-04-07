# ib-gateway-docker-headless

[![Docker](https://github.com/mfrener/ib-gateway-docker-headless/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/mfrener/ib-gateway-docker-headless/actions/workflows/docker-publish.yml)

IB Gateway + IbcAlpha + Xvfb on a Docker Container.

Get it:
```
docker pull docker.pkg.github.com/mfrener/ib-gateway-docker-headless/ib-gateway:latest
```

Run it:
```
docker container run --env TWSUSERID='YOUR_IB_ACCOUNT' --env TWSPASSWORD="YOUR_IB_PASSWORD" --env TRADING_MODE=paper ib-gateway:latest
```
