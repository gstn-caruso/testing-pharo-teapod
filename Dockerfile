######################################
# Based on Ubuntu image
######################################
FROM ubuntu

######################################
# Basic project infos
######################################
LABEL maintainer="gaston"

######################################
# Update Ubuntu apt and install some tools
######################################
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y git \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

######################################
# Have an own directory for the tool
######################################
RUN mkdir webapp
WORKDIR webapp

######################################
# Download Pharo using Zeroconf & start script
######################################
RUN wget -O- https://get.pharo.org/64/70+vm | bash
COPY load.st load.st
RUN ./pharo Pharo.image load.st

######################################
# Finally run headless as server
######################################
CMD ./pharo --headless Pharo.image --no-quit
RUN chmod -R 777 .

