# Generates a docker that
FROM gliderlabs/alpine:latest

RUN mkdir /tmp/install-tl-unx

WORKDIR /tmp/install-tl-unx

COPY TeXProfiles/texlive-small.profile ./texlive.profile

# http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

# Install TeX Live 2018 with some basic collections
RUN apk-install wget perl
RUN wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2018/tlnet-final/install-tl-unx.tar.gz \
    && tar --strip-components=1 -xvf install-tl-unx.tar.gz
RUN ./install-tl --profile texlive.profile

ENV PATH="/usr/local/texlive/2018/bin/x86_64-linuxmusl:${PATH}"
RUN tlmgr install latexmk
RUN tlmgr install lipsum pgf koma-script xcolor

RUN mkdir /repo/
WORKDIR /repo

RUN apk-install perl wget vim git

# COPY execute_tests.sh "/usr/bin/execute_tests"
#
# RUN chmod +x "/usr/bin/execute_tests"
#
# CMD execute_tests
RUN /bin/sh
