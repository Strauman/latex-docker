# latex-docker
Dockers for running LaTeX. Currently only TeXLive:

## texlive dockers
`docker pull strauman/tex:SCHEME` where `SCHEME` is one of `small`, `medium` or `large`.

Example docker file for use:

```
FROM strauman/tex:small
RUN tlmgr install latexmk lipsum pgf koma-script xcolor

RUN mkdir /my_mounted_dir/
WORKDIR /repo

COPY build_my_tex.sh /usr/bin/build_my_tex

RUN chmod +x "/usr/bin/build_my_tex"

CMD ["/usr/bin/build_my_tex"]

```
