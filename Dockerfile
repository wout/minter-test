FROM crystallang/crystal:1.5.1-alpine
MAINTAINER Wout <hi@wout.codes>
EXPOSE 3003

# Install shards
WORKDIR /shards
COPY shard.yml shard.lock ./
RUN  shards install --production

# Add this directory to container as /app
ADD . /app
WORKDIR /app

# Build app
# RUN crystal build --release src/minter-test.cr
RUN crystal build src/minter-test.cr
