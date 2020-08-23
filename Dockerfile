FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -qq --no-install-recommends install apt-utils ca-certificates wget ocl-icd-libopencl1 libssl1.1 openssl libpsl5 publicsuffix netbase g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev \
    && rm -r /var/lib/apt/lists/*
    
RUN cd /tmp \
    && wget -q https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-17.40-492261.tar.xz \
    && tar -Jxvf amdgpu-pro-17.40-492261.tar.xz \
    && cd /amdgpu-pro-17.40-492261
    && ./amdgpu-pro-install –y
    
RUN wget -q --content-disposition https://minergate.com/download/xfast-ubuntu-cli-amd \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "haoseat@gmail.com", "--xmr"]
