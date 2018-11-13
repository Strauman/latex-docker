# latex-docker
Dockers for running LaTeX. Currently only TeXLive.

Made for use in the more self sustained [travis-LaTeXBuild](https://github.com/Strauman/travis-latexbuild) repo.

## texlive dockers
`docker pull strauman/tex:SCHEME` where `SCHEME` is one of `small`, `medium` or `large`.

Example docker file for use:
Assume you have a script `build_my_tex.sh` in your repo,
that builds your LaTeX

```
FROM strauman/tex:small
RUN tlmgr install latexmk lipsum pgf koma-script xcolor

RUN mkdir /my_mounted_dir/
WORKDIR /repo

COPY build_my_tex.sh /usr/bin/build_my_tex

RUN chmod +x "/usr/bin/build_my_tex"

CMD ["/usr/bin/build_my_tex"]

```
