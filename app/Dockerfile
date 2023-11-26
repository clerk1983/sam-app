FROM ubuntu:22.04

WORKDIR /usr/share
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
  curl \
  unzip \
  less \
  git

## AWS-CLI / AWS-SAM
WORKDIR /usr/share/tools/awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install
WORKDIR /usr/share/tools/awssam
RUN curl -L 'https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip' -o 'awssam.zip' && \
  unzip awssam.zip -d sam-installation && \
  ./sam-installation/install


WORKDIR /etc/apt/keyrings
RUN apt-get install -y \
  ca-certificates \
  gnupg

## Nodejs
ENV NODE_MAJOR 20
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | \
  gpg --dearmor -o nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |\
  tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update -y && apt-get install -y nodejs

## Docker Client (Docker-outside-of-Docker)
RUN apt-get install -y lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  gpg --dearmor -o docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list
RUN apt-get update -y && apt-get install -y docker-ce-cli

WORKDIR /usr/app/
