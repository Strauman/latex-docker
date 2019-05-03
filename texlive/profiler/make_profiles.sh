#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_PATH="`realpath "$SCRIPT_PATH/../"`"

# Taken from hooks/build
tar_2018="http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2018/tlnet-final/install-tl-unx.tar.gz"
repo_2018="http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2018/tlnet-final/"
tar_2019="http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2019/install-tl-unx.tar.gz"
repo_2019="https://ctan.crest.fr/tex-archive/systems/texlive/tlnet/"

make_version_profiles(){
  for_tlversion="$1"
  for_install="$2"
  for_repo="$3"
  docker build \
    --build-arg tl_version="$for_tlversion" \
    --build-arg installfile="$for_install"\
    --build-arg ctan_repo="$for_repo"\
    -t "textest:profiler" \
    --file "$SCRIPT_PATH/Dockerfile" \
    "$PARENT_PATH"
  docker run -it \
    --volume="$PARENT_PATH/TeXProfiles:/root/profiles_out" \
    "textest:profiler"
}
make_version_profiles "2019" "$tar_2019" "$repo_2019"
