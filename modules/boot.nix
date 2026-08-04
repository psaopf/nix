{ config, pkgs, ... }:
{
  ### BOOT / KERNEL ###

  boot.initrd.systemd.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.configurationLimit = 5;

  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=0"
    "systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.plymouth.enable = true; # gives a clean splash screen instead of a wall of text

  ### PERFORMANCE ###

  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.scx.enable = true;
  services.scx.scheduler = "scx_lavd";

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  services.fstrim.enable = true;
}
