# Yet another docker image for Folding at Home
FROM ubuntu:16.04
LABEL maintainer "tuan t. pham" <tuan@vt.edu>

ENV	PKGS="wget python bzip2" \
	DEBIAN_FRONTEND=noninteractive \
	PYTHON_SUPPORT_URL=http://launchpadlibrarian.net/109052632/python-support_1.0.15_all.deb \
	FAHCLIENT_URL=https://download.foldingathome.org/releases/beta/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb

RUN	apt-get -yq update && apt-get dist-upgrade -yq && \
	apt-get -yq install ${PKGS} && \
	wget -q -O /tmp/python-support_1.0.15_all.deb ${PYTHON_SUPPORT_URL} && \
	dpkg --install /tmp/python-support_1.0.15_all.deb && \
	wget -q -O /tmp/fahclient.deb ${FAHCLIENT_URL} && \
	dpkg --install /tmp/fahclient.deb && \
	chown fahclient:root /var/lib/fahclient && rm -fr /var/lib/fahclient/* && \
	apt-get autoremove -yq && \
	apt-get autoclean && \
	rm -fr /tmp/* /var/lib/apt/lists/*

COPY	./config.xml /etc/fahclient/config.xml
WORKDIR /var/lib/fahclient

EXPOSE 7396 36330
CMD	["/usr/bin/FAHClient", \
	"--config", "/etc/fahclient/config.xml", \
	"--run-as", "fahclient", \
	"--pid-file=/var/run/fahclient.pid"]
