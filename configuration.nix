{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Prevents the "stateVersion not set" warning on every rebuild.
  system.stateVersion = "26.05";

  imports =
    [ ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/gpu.nix
      ./modules/desktop.nix
      ./modules/audio.nix
      ./modules/networking.nix
      ./modules/users.nix
      ./modules/packages.nix
      ./modules/shell.nix
      ./modules/home.nix
      <home-manager/nixos>
    ];

  home-manager.users.p = {
    imports = [
      ./modules/vscode.nix
    ];
  };
}
