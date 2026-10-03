ARG BUILD_FROM=ghcr.io/hassio-addons/base:21.0.1
FROM ${BUILD_FROM}

ARG BUILD_ARCH=amd64
ARG TUNNEL_CLIENT_VERSION=0.0.15

RUN apk add --no-cache curl unzip \
    && curl --fail --location --silent --show-error \
      "https://github.com/openai/tunnel-client/releases/download/v${TUNNEL_CLIENT_VERSION}/tunnel-client-v${TUNNEL_CLIENT_VERSION}-linux-${BUILD_ARCH}.zip" \
      --output /tmp/tunnel-client.zip \
    && echo "8c836dc5d68d68b663d9a5c5b28ff9fa780d9f7a3fffb1c306880b8f32fab5f1  /tmp/tunnel-client.zip" | sha256sum -c - \
    && unzip -q /tmp/tunnel-client.zip -d /tmp/tunnel-client \
    && install -m 0755 "$(find /tmp/tunnel-client -type f -name tunnel-client -print -quit)" /usr/local/bin/tunnel-client \
    && rm -rf /tmp/tunnel-client /tmp/tunnel-client.zip

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
