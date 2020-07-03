{ stdenv, pkgs, fetchurl, autoPatchelfHook, zlib, ... }:

stdenv.mkDerivation rec {
  name = "maple";
  version = "v0.19";

  src = fetchurl {
    url = "https://github.com/liuchengxu/vim-clap/releases/download/${version}/maple-x86_64-unknown-linux-gnu";
    sha256 = "c56843f35b2fbb37ac58a1df2bb8fb094cf7e1ed34432e5619cb658ceece8db3";
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    openssl.dev
    zlib
  ];

  unpackPhase = ":";

  installPhase = ''
    install -m755 -D $src $out/bin/maple
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/liuchengxu/vim-clap;
    description = "Modern performant generic finder and dispatcher for Vim and NeoVim (maple binary)";
    platforms = platforms.linux;
  };
}
