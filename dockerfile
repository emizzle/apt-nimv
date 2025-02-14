FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
    dpkg-dev \
    dput \
    gnupg2 \
    debhelper \
    devscripts \
    build-essential

WORKDIR /build
VOLUME ["/root/.gnupg", "/root/.dput.cf"]
ENTRYPOINT ["/bin/bash"]