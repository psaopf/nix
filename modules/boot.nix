{ config, pkgs, ... }:
{
  ### BOOT / KERNEL ###

  boot.initrd.systemd.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.graceful = true;  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Early KMS: load NVIDIA modules in initrd so plymouth splash hands off
  # cleanly instead of flickering/falling back to a generic framebuffer
  # resolution mid-boot. (hardware-configuration.nix sets this list to
  # empty by default — this list is additive, not a conflict.)
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

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

  fileSystems."/mnt/500GB" = {
  device = "/dev/disk/by-uuid/D62C9A422C9A1D95";
  fsType = "ntfs3";
  options = [ "force" "uid=1000" "gid=100" "nofail" ];
};

  services.fstrim.enable = true;
}
