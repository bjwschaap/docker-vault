FROM alpine:latest

MAINTAINER Bastiaan Schaap <bastiaan@gntry.io>

COPY repositories /etc/apk/repositories

RUN apk add --update vault           \
                     bash            \
                     ca-certificates \
 && rm -rf /var/cache/apk/*          \
 && rm -rf /usr/share/man            \
 && rm -f  /etc/vault.hcl

VOLUME /var/lib/vault
VOLUME /etc/vault.hcl

EXPOSE 8200

ENTRYPOINT [ "vault", "server", "-config=/etc/vault.hcl" ]
