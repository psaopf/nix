{ config, pkgs, ... }:
{
  ### GPU (NVIDIA RTX 3060 Ti) ###

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # required for Wine/Proton 32-bit titles
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;           # closed module — safer for Ampere gaming
    modesetting.enable = true;
    powerManagement.enable = false; # desktop: suspend/resume power mgmt not needed
    nvidiaSettings = true;
    nvidiaPersistenced = true;
  };

  # Coolbits 12 = fan control (4) + overclocking (8)
  services.xserver.screenSection = ''
    Option "Coolbits" "12"
  '';

  programs.gamemode.enable = true;
}
