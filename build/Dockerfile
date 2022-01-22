# Yet another docker image for Folding at Home
FROM ubuntu:20.04
LABEL maintainer "tuan t. pham" <tuan@vt.edu>

ENV PKGS="wget python3 ca-certificates" \
    DEBIAN_FRONTEND=noninteractive \
    FAHCLIENT_URL=https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.21_amd64.deb

ENV DOCKERIZE_VERSION=v0.6.1

RUN apt-get -yq update && apt-get dist-upgrade -yq && \
    apt-get -yq install --no-install-recommends  ${PKGS} && \
    wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    wget -q -O /tmp/fahclient.deb ${FAHCLIENT_URL} && \
    echo "2827f05f1c311ee6c7eca294e4ffb856c81957e8f5bfc3113a0ed27bb463b094 /tmp/fahclient.deb" \
    | sha256sum -c --strict - && \
    mkdir -p /etc/fahclient && touch /etc/fahclient/config.xml && \
    dpkg --install /tmp/fahclient.deb && \
    chown fahclient:root /var/lib/fahclient /etc/fahclient && rm -fr /var/lib/fahclient/* && \
    rm /etc/fahclient/config.xml && \
    apt-get autoremove -yq && \
    apt-get autoclean && \
    rm -fr /tmp/* /var/lib/apt/lists/*

COPY  ./config.xml.tmpl /etc/fahclient/config.xml.tmpl
WORKDIR /var/lib/fahclient

USER  fahclient

EXPOSE 7396 36330

CMD  ["dockerize", \
  "-template", "/etc/fahclient/config.xml.tmpl:/etc/fahclient/config.xml", \
  "/usr/bin/FAHClient", \
  "--config", "/etc/fahclient/config.xml", \
  "--run-as", "fahclient", \
  "--pid-file=/var/run/fahclient.pid"]
