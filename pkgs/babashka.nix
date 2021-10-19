{ stdenv, fetchurl, autoPatchelfHook, zlib, ... }:

stdenv.mkDerivation rec {
  name = "babashka";
  version = "0.6.2";

  src = fetchurl {
    url = "https://github.com/borkdude/babashka/releases/download/v${version}/babashka-${version}-linux-amd64.tar.gz";
    sha256 = "1inykwismfnpkdrkg61pdgpgk037w31ivw47m53clb0r3p3x1qj0";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
    zlib
  ];

  unpackPhase = ''
    tar -xzf $src
  '';

  installPhase = ''
    install -m755 -D bb $out/bin/bb
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/borkdude/babashka;
    description = "A Clojure babushka for the grey areas of Bash.";
    platforms = platforms.linux;
  };
}
