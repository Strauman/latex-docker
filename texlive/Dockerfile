# Generates a TeXLive docker
FROM alpine:latest
ARG scheme

RUN mkdir /tmp/install-tl-unx

WORKDIR /tmp/install-tl-unx

COPY TeXProfiles/texlive-$scheme.profile ./texlive.profile

# Install TeX Live 2018 with some basic collections
RUN apk add --no-cache --update perl wget
RUN wget ftp://tug.org/historic/systems/texlive/2018/install-tl-unx.tar.gz \
    && tar --strip-components=1 -xvf install-tl-unx.tar.gz \
    && ./install-tl --profile texlive.profile

ENV PATH="/usr/local/texlive/2018/bin/x86_64-linuxmusl:${PATH}"
# Since we downloaded 2018, fix the repository version also on 2018
RUN tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2018/tlnet-final/
RUN tlmgr update --self
RUN tlmgr install latexmk
