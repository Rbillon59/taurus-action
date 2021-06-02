FROM openjdk:11-slim

RUN apt-get update && \
    apt-get install -y python3 \
                    python3-tk \
                    python3-pip \
                    python3-dev \
                    libxml2-dev \
                    libxslt-dev \
                    zlib1g-dev \
                    net-tools \
    && python3 -m pip install -U pip && python3 -m pip install bzt \
    && apt-get purge -y python3-pip python3-dev python3-tk libxml2-dev libxslt-dev zlib1g-dev  \
    && apt-get autoremove -y \
    && apt-get clean


COPY entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT "/tmp/entrypoint.sh"

