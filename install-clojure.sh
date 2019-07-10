#!/usr/bin/env sh

set -xe

cd /tmp

VERSION=1.10.1.462

curl -O https://download.clojure.org/install/linux-install-$VERSION.sh
chmod +x linux-install-$VERSION.sh
sudo ./linux-install-$VERSION.sh
