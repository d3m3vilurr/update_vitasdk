#!/usr/bin/env bash
mv $VITASDK $VITASDK.bak
curl -s https://api.github.com/repos/d3m3vilurr/buildscripts/releases | grep browser_download_url | grep linux | head -n 1 | cut -d '"' -f 4 | xargs curl -L | tar xvj
mv vitasdk $VITASDK
#cp -r vitasdk $VITASDK

mkdir build
mkdir patches

curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/patches/expat-25c6393829.patch -o patches/expat-25c6393829.patch
curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/patches/opus-update-ssl-curl.patch -o patches/opus-update-ssl-curl.patch

cd build
curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/scripts/007-vdpm.sh | bash
curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/scripts/010-vita-openssl.sh | bash
curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/scripts/011-vita-curl.sh | bash
curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/scripts/012-expat.sh | bash
curl -sL https://github.com/d3m3vilurr/vitatoolchain/raw/update-ssl-curl/scripts/013-opus.sh | bash
cd ..
rm -rf build patches $VITASDK.bak
