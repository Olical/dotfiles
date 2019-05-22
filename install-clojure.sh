#!/usr/bin/env sh

set -xe

cd /tmp

curl -O https://download.clojure.org/install/linux-install-1.10.0.442.sh
chmod +x linux-install-1.10.0.442.sh
sudo ./linux-install-1.10.0.442.sh

curl -sO https://raw.githubusercontent.com/borkdude/clj-kondo/master/script/install-clj-kondo
chmod +x install-clj-kondo
sudo ./install-clj-kondo
