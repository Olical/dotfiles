{ stdenv, pkgs, fetchurl, autoPatchelfHook, zlib, ... }:

stdenv.mkDerivation rec {
  name = "maple";
  version = "v0.20";

  src = fetchurl {
    url = "https://github.com/liuchengxu/vim-clap/releases/download/${version}/maple-x86_64-unknown-linux-musl";
    sha256 = "84f4d0ceeb0323837d88762e644c475e047a605857d42748b2e514a5dd4945e5";
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
