FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install --yes bzip2 wget libxext6 libllvm6.0 mesa-utils

COPY download.sh /download.sh
RUN chmod +x /download.sh && /download.sh
COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]
