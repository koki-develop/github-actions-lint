FROM alpine:3.21.3 AS builder
ENV GHALINT_VERSION=1.2.3

RUN wget -O /tmp/ghalint.tar.gz "https://github.com/suzuki-shunsuke/ghalint/releases/download/v${GHALINT_VERSION}/ghalint_${GHALINT_VERSION}_linux_amd64.tar.gz"
RUN tar -xzf /tmp/ghalint.tar.gz -C /tmp

# ---

FROM alpine:3.21.3 AS runner
WORKDIR /repo
ENV GHALINT_LOG_COLOR=always

COPY --from=builder /tmp/ghalint /usr/local/bin/ghalint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
