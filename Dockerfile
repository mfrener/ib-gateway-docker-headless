# Install Linux tools and libs

FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install --no-install-recommends --yes wget unzip xvfb libxrender1 libxtst6 libxi6 libgtk2.0-bin 
RUN apt-get clean

# Install IB Gateway

WORKDIR /opt/Jts/981
RUN wget https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-linux-x64.sh --no-check-certificate
RUN chmod a+x tws-latest-standalone-linux-x64.sh
RUN ./tws-latest-standalone-linux-x64.sh -q -dir /opt/Jts/981
RUN rm ./tws-latest-standalone-linux-x64.sh
ENV TWS_MAJOR_VRSN 981
ENV TWS_PATH /opt/Jts
ENV IBC_PATH /opt/ibc
ENV IBC_INI /opt/ibc/config.ini
ENV TWOFA_TIMEOUT_ACTION exit

# Install IbcAlpha

WORKDIR /opt/ibc
RUN wget https://github.com/IbcAlpha/IBC/releases/download/3.8.5/IBCLinux-3.8.5.zip --no-check-certificate
RUN unzip ./IBCLinux-3.8.5.zip -d .
COPY ./config/ibc/* .
RUN chmod -R u+x *.sh && chmod -R u+x scripts/*.sh
RUN rm ./IBCLinux-3.8.5.zip

# Install run script

WORKDIR /root
ADD ./scripts/run.sh ./run.sh
RUN chmod a+x ./run.sh

# Run Xvfb and IB Gateway

ENV DISPLAY :1
EXPOSE 4001
EXPOSE 4002
CMD ["/root/run.sh"]

