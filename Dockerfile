from debian:bullseye-slim

RUN useradd -ms /bin/bash admin

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq \
    && apt-get install -y -qq --no-install-recommends \
               ca-certificates \
               curl \
    && echo "CURL INSTALLED" \
    && TMPBUILD=$(mktemp -d) \
    && cd $TMPBUILD \
    && curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.3.9/argo-linux-amd64.gz \
    && gunzip argo-linux-amd64.gz \
    && chmod +x argo-linux-amd64 \
    && mv ./argo-linux-amd64 /usr/local/bin/argo \
    && cd \
    && rm -rf $TMPBUILD
