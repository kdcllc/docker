# PROVIDES with needed libraries for running https://github.com/tyiannak/pyAudioAnalysis
FROM ubuntu:16.04

LABEL maintainer="King David Consulting LLC <info@kingdavidconsulting.com>"

##Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tzdata && \
     dpkg-reconfigure -f noninteractive tzdata && \
    echo "America/New_York" > /etc/timezone

RUN apt-get update --fix-missing && apt-get install -y wget ca-certificates \
    python \
    python3 \
    python3-dev \
    python-pip \
    python-setuptools \
    python-virtualenv \
    python-numpy \
    python-scipy \
    python-matplotlib \
    ipython \
    python-pandas \
    python-sympy \
    python-nose \
    python-tk \
    python3-tk \
    tk-dev\
    unzip \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    libav-tools ffmpeg \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /opt/conda/bin:$PATH

RUN pip --no-cache-dir install --upgrade \
        altair \
        sklearn-pandas

