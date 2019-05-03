# Generates a TeXLive docker
FROM alpine:latest
ARG installfile
ARG tl_version
ARG ctan_repo
RUN mkdir /tmp/install-tl-unx

WORKDIR /tmp/install-tl-unx

RUN apk add --no-cache --update perl wget
RUN wget $installfile \
    && tar --strip-components=1 -xvf install-tl-unx.tar.gz

# tug.org's ftp server seems down atm
ENV PATH="/usr/local/texlive/$tl_version/bin/x86_64-linuxmusl:${PATH}"
ENV CTAN_REPO=$ctan_repo
ENV INSTALLFILE=$installfile
ENV TL_VERSION=$tl_version
COPY /profiler/docker_generate_profiles.sh ./generate_profiles.sh
RUN chmod +x ./generate_profiles.sh
CMD ./generate_profiles.sh
#
# RUN tlmgr update --self
# RUN tlmgr install latexmk
