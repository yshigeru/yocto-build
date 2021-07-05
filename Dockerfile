FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

# Install required packages
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
 && apt-get install -y \
      gawk wget git-core diffstat unzip texinfo gcc-multilib \
      build-essential chrpath socat \
      libsdl1.2-dev xterm \
      make xsltproc docbook-utils fop dblatex xmlto \
      autoconf automake libtool libglib2.0-dev libarchive-dev \
      python3-git \
      locales iproute2 iputils-ping vim zsh cpio

# Locales
RUN dpkg-reconfigure locales \
 && locale-gen en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
