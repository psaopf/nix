{ config, pkgs, ... }:
{
  ### USERS ###

  users.users."p" = {
    isNormalUser = true;
    description = "p";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
  };
}
