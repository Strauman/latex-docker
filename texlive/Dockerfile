# Generates a TeXLive docker
FROM alpine:latest
ARG scheme
ARG installfile
ARG tl_version
RUN mkdir /tmp/install-tl-unx

WORKDIR /tmp/install-tl-unx

COPY TeXProfiles/$tl_version/texlive-$scheme.profile ./texlive.profile

# Install TeX Live 2018 with some basic collections
RUN apk add --no-cache --update perl wget
RUN wget $installfile \
    && tar --strip-components=1 -xvf install-tl-unx.tar.gz \
    && ./install-tl --profile texlive.profile

ENV PATH="/usr/local/texlive/$tl_version/bin/x86_64-linuxmusl:${PATH}"
RUN tlmgr update --self
RUN tlmgr install latexmk
