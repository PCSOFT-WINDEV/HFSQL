FROM debian:trixie-slim

LABEL maintainer="PCSOFT <network@pcsoft.fr>"

ARG HFSQL_VERSION=31.5.005

RUN set -x \
	&& groupadd -r hfsql --gid=4900 && useradd -r -g hfsql --uid=4900 hfsql \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y curl ca-certificates \
	&& mkdir -p /etc/apt/keyrings \
	&& curl -sSL https://package.windev.com/keys/hfsql_public.asc -o /etc/apt/keyrings/hfsql.asc \
	&& echo "deb [signed-by=/etc/apt/keyrings/hfsql.asc] http://package.windev.com/us/debian/ debian main" > /etc/apt/sources.list.d/pcsoft.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y libqt5widgets5 hfsql="${HFSQL_VERSION}" \
	&& apt-get remove --purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/hfsql
EXPOSE 4900

USER hfsql

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["hfsql"]


