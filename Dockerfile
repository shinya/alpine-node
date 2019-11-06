FROM alpine:3.10

RUN apk add --update --no-cache bash python git make gcc g++ wget build-base linux-headers \
	&& mkdir -p /build \
	&& cd /build \
	&& wget https://nodejs.org/dist/v8.16.2/node-v8.16.2.tar.gz \
	&& tar zxvf node-v8.16.2.tar.gz \
	&& cd node-v8.16.2 \
	&& ./configure \
	&& make \
	&& make install \
	&& cd ~/ \
	&& rm -fr /build/node-v8.16.2 /build/node-v8.16.2.tar.gz \
	&& apk del bash python git make gcc g++ wget build-base linux-headers \
	&& rm -f /var/cache/apk/*
