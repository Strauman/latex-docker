# latex-docker
Dockers for running LaTeX. Currently only TeXLive.

Made for use in the more self sustained [travis-LaTeXBuild](https://github.com/Strauman/travis-latexbuild) repo.

## Tags -- Schemes and versions
**NB:** The earlier `small` scheme is now renamed `basic` to be consistent with the texlive install profile names.

Three schemes based on the default `install-tl` software as described [here](https://www.tug.org/texlive/doc/install-tl.html#PROFILES).

Tags would be `strauman/tex:TAG`, where tag would be on the form `scheme` or `scheme-version`.
Supported schemes are `basic`, `small` or `medium`.

Versions are `tlmgr` year versions. Currently `2018` and `2019` is supported, as well with `latest`. I'll add more on request.

`latest` will point to the latest stable release of [TeX Live](https://tug.org/texlive/acquire-netinstall.html).

Examples:
- `strauman/tex:small` (equivalent to `strauman/tex:small-latest`)
- `strauman/tex:medium-2018`
- `strauman/tex:basic-2019`

latexmk is installed by default in all versions.


## texlive dockers
`docker pull strauman/tex:SCHEME` where `SCHEME` is described above.

`SCHEME` can also contain a version specification. E.g. `tex:small-2018` or `tex:medium-latest`.
`-latest` can be omitted, such that `tex:small-latest` is equvalent to `tex:small`.

Example docker file for use:
Assume you have a script `build_my_tex.sh` in your repo,
that builds your LaTeX

```
FROM strauman/tex:small
RUN tlmgr install latexmk lipsum pgf koma-script xcolori

RUN mkdir /my_mounted_dir/
WORKDIR /repo

COPY build_my_tex.sh /usr/bin/build_my_tex

RUN chmod +x "/usr/bin/build_my_tex"

CMD ["/usr/bin/build_my_tex"]

```


## Instructions maintaining the docker images (only relevant if you want to e.g. clone this repo)
- For testing purposes, run `texlive/localbuild.sh` to build the `small` scheme locally.
- Run `profiler/make_profiles.sh` to semi-automatically make profiles for the dockers.
