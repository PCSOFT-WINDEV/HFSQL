FROM debian:stretch-slim

MAINTAINER PCSOFT <network@pcsoft.fr>

ARG HFSQL_VERSION=24.0.077.c
ARG HFSQL_LANG=us

RUN set -x \
	&& groupadd -r hfsql --gid=4900 && useradd -r -g hfsql --uid=4900 hfsql \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y gnupg1 \
	&& apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 3a2b08fb11ba9bca \
	&& apt-get remove --purge --auto-remove -y gnupg1 \
	&& echo "deb http://package.windev.com/${HFSQL_LANG}/debian/ debian main" > /etc/apt/sources.list.d/pcsoft.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y libqtgui4 hfsql="${HFSQL_VERSION}" \
	&& rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/hfsql
EXPOSE 4900

USER hfsql

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["hfsql"]


