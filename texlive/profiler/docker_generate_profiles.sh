#!/bin/ash
read -p "Press P when texlive gui appears. Hit enter to continue."
make_scheme_profile(){
  scheme_name="$1"
  ./install-tl --repository $CTAN_REPO --scheme "$scheme_name"
  cp "texlive.profile" "/root/profiles_out/$TL_VERSION/texlive-$scheme_name.profile"
}
make_scheme_profile "basic"
make_scheme_profile "small"
make_scheme_profile "medium"
make_scheme_profile "full"
