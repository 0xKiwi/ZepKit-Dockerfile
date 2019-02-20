FROM ubuntu:18.04

EXPOSE 3000 8545

WORKDIR /zeppelin

RUN apt update
RUN yes | apt install nodejs npm git nano

# Install truffle
RUN npm install -g truffle@5.0.2

# Install npx
RUN npm install -g npx

# Install ganache-cli
RUN npm install -g ganache-cli@6.3.0

# Unbox zepkit truffle box
RUN npx truffle unbox zeppelinos/zepkit

# Install latest version of ZOS
RUN npm install zos@2.2.0

# Set up build files
RUN truffle compile --all
RUN mkdir build && cp -r client/src/contracts/ build/

# COPY /zeppelin .
# RUN echo 'MNENOMIC="MNENOMIC_HERE"' > .env
