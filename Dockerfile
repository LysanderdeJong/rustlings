FROM rust:latest

RUN rustup update

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install curl gcc git python3-pip -y --no-install-recommends \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN pip3 install --upgrade pip --no-cache-dir

WORKDIR /usr/src/rustlings
COPY . .
RUN cargo install --force --path .
RUN rustup component add clippy

# CMD ["myapp"]