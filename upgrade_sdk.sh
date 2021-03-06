#!/usr/bin/env bash
mkdir -p $VITASDK
mv $VITASDK $VITASDK.bak
curl -s https://api.github.com/repos/vitasdk/autobuilds/releases | grep browser_download_url | grep linux | head -n 1 | cut -d '"' -f 4 | xargs curl -L | tar xvj
mv vitasdk $VITASDK
#cp -r vitasdk $VITASDK

mkdir build
mkdir patches

curl -sL https://github.com/ooPo/vitatoolchain/raw/master/patches/expat-25c6393829.patch -o patches/expat-25c6393829.patch
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/patches/opus-update-ssl-curl.patch -o patches/opus-update-ssl-curl.patch

cd build
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/scripts/007-vdpm.sh | bash
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/scripts/009-libftpvita.sh | bash
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/scripts/010-vita-openssl.sh | bash
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/scripts/011-vita-curl.sh | bash
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/scripts/012-expat.sh | bash
curl -sL https://github.com/ooPo/vitatoolchain/raw/master/scripts/013-opus.sh | bash
cd ..
rm -rf build patches
rm -rf $VITASDK.bak
