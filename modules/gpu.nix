{ config, pkgs, ... }:
{
  ### GPU (NVIDIA RTX 3060 Ti) ###

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # required for Wine/Proton 32-bit titles
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "610.57.04";
      sha256_64bit = "sha256-suk1xmuDuwDAyFe8jg7g/VLekoa0DJzB7sKafOfrEW0=";
      sha256_aarch64 = "sha256-QCefrMBCmpOwuOyXv1k5Gj0iB2CYlPgnG3JToUw/j54=";
      openSha256 = "sha256-rQHOOOY4KL92Ww3KDwh+j4eGU7oNAH8LutZC5wmFnPo=";
      settingsSha256 = "sha256-ZEMo8I8Zc2Tq6RVDNYpAH+f094dUaZiBqO+5f6lIjRI=";
      persistencedSha256 = "sha256-aXmD2VY1RLlgAnlHhOUMWzvMyhI6JTClcFLm4imF/mA=";
    };
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
