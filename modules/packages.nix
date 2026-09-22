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
  #services.udev.extraRules = let
  #    cam = pkgs.writeShellScript "webcam-tune" ''
  #      v=${pkgs.v4l-utils}/bin/v4l2-ctl
  #      sleep 2
  #      $v -d "$1" -c focus_automatic_continuous=0 -c white_balance_automatic=0 \
  #        -c auto_exposure=1 -c exposure_dynamic_framerate=1
  #      $v -d "$1" -c focus_absolute=0 -c white_balance_temperature=2300 \
  #        -c exposure_time_absolute=917 -c gain=10 -c brightness=128 \
  #        -c contrast=110 -c saturation=115 -c sharpness=150
  #    '';
  #  in ''
  #    ACTION=="add", SUBSYSTEM=="video4linux", ATTRS{idVendor}=="046d", ATTR{index}=="0", \
  #      RUN+="${pkgs.systemd}/bin/systemd-run --no-block ${cam} $devnode"
  #  '';

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
    evolution

    # dev
    python3

    # internet
    qbittorrent
    mullvad-vpn

    # misc
    vlc
    flameshot
    wineWow64Packages.stable  # wineWowPackages was deprecated upstream
    umu-launcher
    libreoffice-qt-fresh
    heroic
  ];
}
