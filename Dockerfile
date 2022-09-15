FROM debian:buster

# https://store.steampowered.com/app/222860/Left_4_Dead_2_Dedicated_Server/
ARG STEAM_APP_ID=222860

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6-i386 lib32gcc1 lib32stdc++6 screen
RUN apt-get install -y screen
RUN apt-get install -y wget

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

WORKDIR /root/

RUN mkdir ~/steamcmd                                                && \
    cd ~/steamcmd                                                   && \
    wget http://media.steampowered.com/client/steamcmd_linux.tar.gz && \
    tar -xf steamcmd_linux.tar.gz                                   && \
    rm steamcmd_linux.tar.gz
RUN echo "Installing L4D2 app version $STEAM_APP_ID ..."
RUN bash ~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/games +app_update $STEAM_APP_ID validate +quit

ENV L4D2_SERVER_HOSTNAME='l4d2'
ENV L4D2_SERVER_SV_REGION=255
ENV L4D2_SERVER_MAX_PLAYERS=4

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh

EXPOSE 27015/tcp
EXPOSE 27015/udp
