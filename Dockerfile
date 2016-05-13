FROM alpine:latest

MAINTAINER Bastiaan Schaap <bastiaan@gntry.io>

COPY repositories /etc/apk/repositories

RUN apk add --update vault     \
 && rm -rf /var/cache/apk/*    \
 && rm -rf /usr/share/man 

COPY vault.hcl /etc/vault.hcl

VOLUME /var/lib/vault
EXPOSE 8200

ENTRYPOINT [ "vault", "server", "-config=/etc/vault.hcl" ]