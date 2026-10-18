{ config, pkgs, ... }:
{
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
    wineWow64Packages.stable
    umu-launcher

    #Tools
    flameshot

    # Office
    libreoffice-qt-fresh

  ];
}
