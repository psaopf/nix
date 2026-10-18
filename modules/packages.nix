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
    # xorg.* names were deprecated — use top-level aliases instead
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



  ### PACKAGES ###

  #PERIPHERALS
  hardware.openrazer.enable = true;

  #MullVad
  services.mullvad-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    # terminal
    ghostty
    btop

    # peripherals
    razergenie
    polychromatic
    openrgb
    cheese
    pkgs.v4l-utils

    # comms
    discord

    # dev
    python3
    ffmpeg

    #Media
    vlc

    # internet
    qbittorrent
    mullvad-vpn

    # Gaming
    heroic
    mangohud
    wineWow64Packages.stable  # wineWowPackages was deprecated upstream
    umu-launcher

    #Tools
    flameshot

    # Office
    libreoffice-qt-fresh

  ];
}
