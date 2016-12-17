#!/usr/bin/env bash
#install build toolchain
mkdir -p $VITASDK
mv $VITASDK $VITASDK.bak
curl -s https://api.github.com/repos/vitasdk/autobuilds/releases | grep browser_download_url | grep linux | head -n 1 | cut -d '"' -f 4 | xargs curl -L | tar xvj
mv vitasdk $VITASDK
#cp -r vitasdk $VITASDK

# install vdpm
#curl -sL https://github.com/vitasdk/vdpm/raw/master/vdpm -o $VITASDK/bin/vdpm
curl -sL https://github.com/d3m3vilurr/vdpm/raw/support-local-xz/vdpm -o vdpm
chmod +x vdpm
cp vdpm $VITASDK/bin/vdpm

# install makepkg
#git clone https://github.com/vitasdk/vita-makepkg.git
git clone https://github.com/d3m3vilurr/vita-makepkg.git
cd vita-makepkg
git checkout fix-hardcoded-path
cp makepkg.conf.sample makepkg.conf
cd ..
mv vita-makepkg $VITASDK/lib
ln -s $VITASDK/lib/vita-makepkg/vita-makepkg $VITASDK/bin/vita-makepkg

# install vita packages
git clone https://github.com/vitasdk/packages.git
mv packages $VITASDK/

# install all vdpm packages
curl -L https://github.com/vitasdk/vdpm/raw/master/install-all.sh | bash

rm vdpm
rm -rf $VITASDK.bak
