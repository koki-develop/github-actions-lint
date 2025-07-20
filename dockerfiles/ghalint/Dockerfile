FROM alpine:3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715 AS builder
ENV GHALINT_VERSION=1.4.1

RUN wget -O /tmp/ghalint.tar.gz "https://github.com/suzuki-shunsuke/ghalint/releases/download/v${GHALINT_VERSION}/ghalint_${GHALINT_VERSION}_linux_amd64.tar.gz"
RUN tar -xzf /tmp/ghalint.tar.gz -C /tmp

# ---

FROM alpine:3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715 AS runner
WORKDIR /repo
ENV GHALINT_LOG_COLOR=always

COPY --from=builder /tmp/ghalint /usr/local/bin/ghalint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
