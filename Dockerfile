FROM debian:stretch

MAINTAINER Rene Luria <rene@luria.ch>


RUN apt-get update \
	&& apt-get -y install --no-install-recommends \
		curl \
		apt-transport-https \
		gnupg2 \
		ca-certificates \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
	echo "deb [arch=amd64] https://packages.microsoft.com/debian/stretch/prod stretch main" > /etc/apt/sources.list.d/microsoft-prod.list && \
	apt-get update

RUN apt-get -y install --no-install-recommends powershell

ENTRYPOINT '/usr/bin/pwsh'
