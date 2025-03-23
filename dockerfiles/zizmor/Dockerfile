FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS reviewdog-installer
ENV REVIEWDOG_VERSION=0.20.3

RUN wget -O /tmp/reviewdog.tar.gz https://github.com/reviewdog/reviewdog/releases/download/v${REVIEWDOG_VERSION}/reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz
RUN tar -xzf /tmp/reviewdog.tar.gz -C /tmp

# ---

FROM ghcr.io/woodruffw/zizmor:1.5.1@sha256:59c0a546bcfe4d6c040fe1532ddc2f6ccc63e59ebd6bc4f8f4ec741d1b77899d
WORKDIR /repo

COPY --from=reviewdog-installer /tmp/reviewdog /usr/local/bin/reviewdog
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
