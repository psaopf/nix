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
  # RegistryDwords forces the GPU to stay at max performance state (P0)
  # instead of dynamically stepping clocks up/down mid-game, which is a
  # common source of stutter/lag on NVIDIA + Linux.
  services.xserver.screenSection = ''
    Option "Coolbits" "12"
    Option "RegistryDwords" "PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3"
  '';

  programs.gamemode.enable = true;
}
