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

  ### PERIPHERALS / SERVICES ###

  hardware.openrazer.enable = true;

  # services.mullvad-vpn.enable already pulls in the mullvad package;
  # listing mullvad-vpn in systemPackages too caused the version-collision
  # warnings seen in the build output (mullvad-2026.2 vs mullvad-vpn-2026.3).
  services.mullvad-vpn.enable = true;

  ### PACKAGES ###

  environment.systemPackages = with pkgs; [
    # terminal
    ghostty
    btop

    # peripherals
    razergenie
    polychromatic

    # comms
    discord
    evolution

    # dev
    vscode
    python3

    # internet
    # ungoogled-chromium is now managed by home-manager (see home.nix)
    qbittorrent

    # misc
    vlc
    flameshot
    wineWow64Packages.stable  # wineWowPackages was deprecated upstream
    umu-launcher
    libreoffice-qt-fresh
    heroic
  ];
}
