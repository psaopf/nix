{ config, pkgs, ... }:
{
  ### PROGRAM SETTINGS ###
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."p" = {
    isNormalUser = true;
    description = "p";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
  };

  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
  ghostty
  discord
  razergenie
  polychromatic
  vscode
  gedit
  ungoogled-chromium
  btop
  overskride
  flameshot
  evolution
  ];

}
