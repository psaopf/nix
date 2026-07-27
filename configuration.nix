{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/system.nix
      ./modules/programs.nix
      ./modules/configs.nix
      ./modules/home.nix
      <home-manager/nixos>
    ];

  home-manager.users.p = {
    imports = [
      ./modules/vscode.nix
    ];
  };
}
