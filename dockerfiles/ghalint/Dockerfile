FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS builder
ENV GHALINT_VERSION=1.4.0

RUN wget -O /tmp/ghalint.tar.gz "https://github.com/suzuki-shunsuke/ghalint/releases/download/v${GHALINT_VERSION}/ghalint_${GHALINT_VERSION}_linux_amd64.tar.gz"
RUN tar -xzf /tmp/ghalint.tar.gz -C /tmp

# ---

FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS runner
WORKDIR /repo
ENV GHALINT_LOG_COLOR=always

COPY --from=builder /tmp/ghalint /usr/local/bin/ghalint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
