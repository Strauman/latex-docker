# Generates a TeXLive docker
FROM alpine:latest
ARG scheme
ARG installfile
ARG tl_version
ARG ctan_repo
RUN mkdir /tmp/install-tl-unx
ENV CTAN_REPO=$ctan_repo
WORKDIR /tmp/install-tl-unx

COPY TeXProfiles/$tl_version/texlive-$scheme.profile ./texlive.profile

# Install TeX Live 2018 with some basic collections
RUN apk add --no-cache --update perl wget
RUN wget $installfile \
    && tar --strip-components=1 -xvf install-tl-unx.tar.gz

# tug.org's ftp server seems down atm
RUN ./install-tl --profile texlive.profile --repository="$ctan_repo"
ENV PATH="/usr/local/texlive/$tl_version/bin/x86_64-linuxmusl:${PATH}"
RUN tlmgr option repository "$CTAN_REPO"
RUN tlmgr update --self
RUN tlmgr install latexmk
