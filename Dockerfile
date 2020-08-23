FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -qq --no-install-recommends install apt-utils ca-certificates wget ocl-icd-libopencl1 libssl1.1 openssl libpsl5 publicsuffix netbase g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev \
    && rm -r /var/lib/apt/lists/*
    
RUN apt install libnuma-dev \    
    && wget -q -O - http://repo.radeon.com/rocm/rocm.gpg.key | sudo apt-key add - \
    && echo 'deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main' | sudo tee /etc/apt/sources.list.d/rocm.list \
    && apt install rocm-dkms \
    && apt-get -qq --no-install-recommends install dkms rock-dkms rocm-opencl-dev \
    && echo 'export PATH=$PATH:/opt/rocm/bin' > ~/.bashrc
    && echo 'export PATH=$PATH:/opt/rocm/opencl/include' > ~/.bashrc  
    && echo 'export PATH=$PATH:/opt/rocm/opencl/bin/x86_64' > ~/.bashrc
    && echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rocm/lib:/opt/rocm/opencl/lib/x86_64:/opt/rocm/hip/lib' > ~/.bashrc
    && echo 'export AMDAPPSDKROOT=/opt/rocm/opencl' > ~/.bashrc
    
RUN wget -q --content-disposition https://minergate.com/download/xfast-ubuntu-cli-amd \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "haoseat@gmail.com", "--xmr"]
