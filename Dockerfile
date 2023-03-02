FROM debian:buster-slim

MAINTAINER PCSOFT <network@pcsoft.fr>

ARG HFSQL_VERSION=28.0.066
ARG HFSQL_LANG=fr

RUN set -x \
	&& groupadd -r hfsql --gid=4900 && useradd -r -g hfsql --uid=4900 hfsql \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y gnupg1 curl ca-certificates \
	&& curl -sSL https://package.windev.com/keys/hfsql_public.asc | apt-key add - \
	&& apt-get remove --purge --auto-remove -y gnupg1 curl \
	&& echo "deb http://package.windev.com/${HFSQL_LANG}/debian/ debian main" > /etc/apt/sources.list.d/pcsoft.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y libqt5widgets5 hfsql="${HFSQL_VERSION}" \
	&& rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/hfsql
EXPOSE 4900

USER hfsql

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["hfsql"]


