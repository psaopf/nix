{ config, pkgs, ... }:
{
  ### DESKTOP (X11 + Cinnamon) ###

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # services.xserver.libinput.enable = true; # touchpad, on by default for most DEs

  ### LOGIN SCREEN ###

  services.xserver.displayManager.lightdm.background = /home/p/Pictures/wallpaper.jpg;

  ### PRINTING ###

  services.printing.enable = true;
}
