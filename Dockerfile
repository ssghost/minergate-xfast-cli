FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -qq --no-install-recommends install apt-utils ca-certificates wget ocl-icd-libopencl1 libssl1.1 openssl libpsl5 publicsuffix netbase g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev \
    && rm -r /var/lib/apt/lists/*
    
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl libnuma-dev gnupg \
  && curl -sL http://repo.radeon.com/rocm/apt/debian/rocm.gpg.key | apt-key add - \
  && printf "deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main" | tee /etc/apt/sources.list.d/rocm.list \
  && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  sudo \
  libelf1 \
  rocm-dev \
  build-essential && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
    
RUN wget -q --content-disposition https://minergate.com/download/xfast-ubuntu-cli-amd \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "haoseat@gmail.com", "--xmr"]
