{ config, pkgs, ... }:
{
  ### NIX-LD (for scraper script / other non-nix binaries) ###

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    glib
    nspr
    nss
    atk
    cups
    dbus
    expat
    fontconfig
    freetype
    gtk3
    pango
    cairo
    libdrm
    mesa
    alsa-lib
    libxcb
    libx11
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
    libxshmfence
    libxkbfile
  ];

}