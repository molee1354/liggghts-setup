FROM ubuntu:20.04

# Install & configure tzdata
RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Installing compilers & essentials
RUN apt-get -y install \
    git \
    bash \
    build-essential \
    g++ \
    gcc \
    gdb \
    libz-dev \
    openssh-client \
    python3 \
    sudo \
    && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/bin/python3 /usr/local/bin/python

## Installing LIGGGHTS dependencies
RUN apt-get update && apt-get -y install \
    openmpi-bin \
    openmpi-common \
    libopenmpi-dev \
    libvtk6.3 \
    libvtk6-dev

# Setting up user and password
RUN useradd -m -G sudo -s /bin/bash \
    -p $(perl -e 'print crypt($ARGV[0], "password")' 'granular') granular

WORKDIR /home/granular

# Cloning the LIGGGHTS-PUBLIC repo from github
RUN git clone https://github.com/CFDEMproject/LIGGGHTS-PUBLIC.git

# Building LIGGGHTS-PUBLIC
RUN cd LIGGGHTS-PUBLIC/src && make auto && cp ./lmp_auto /usr/local/bin

USER granular

ENTRYPOINT ["/bin/bash"]
