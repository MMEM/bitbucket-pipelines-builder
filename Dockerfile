FROM python:3.7-alpine3.12

RUN pip install --upgrade --user awscli
RUN apk add git \
    docker \
    jq \
    curl \
    nodejs \
    npm \
    bash # We need a new version of bash for indirection features


RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod 755 /usr/local/bin/ecs-cli

RUN npm install -g serverless
#RUN curl -o- -L https://slss.io/install | bash

# Add aws to the path
ENV PATH=/root/.local/bin:$PATH

# Set default work directory
WORKDIR /

