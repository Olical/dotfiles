{ stdenv, fetchurl, autoPatchelfHook, zlib, ... }:

stdenv.mkDerivation rec {
  name = "babashka";
  version = "0.4.1";

  src = fetchurl {
    url = "https://github.com/borkdude/babashka/releases/download/v${version}/babashka-${version}-linux-amd64.tar.gz";
    sha256 = "1wsv5fq8a4692q327nxvh9ca1ajzsdkl0v2v2vh5a5lzicarzc9w";
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
