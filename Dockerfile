FROM ubuntu:18.04
MAINTAINER alimuratgymn
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get update && apt-get -qq --no-install-recommends install apt-utils ca-certificates wget ocl-icd-libopencl1 libssl1.1 openssl libpsl5 publicsuffix netbase g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev  && rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://minergate.com/download/xfast-ubuntu-cli-amd \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "miningaddress@gmx-topmail.de", "--xmr"]
