{ config, pkgs, ... }:
{
  ### SHELL ###

  programs.bash.shellAliases = {
    e  = "sudo codium /etc/nixos/configuration.nix     --no-sandbox --user-data-dir /tmp";
    b  = "sudo codium /etc/nixos/modules/boot.nix       --no-sandbox --user-data-dir /tmp";
    g  = "sudo codium /etc/nixos/modules/gpu.nix        --no-sandbox --user-data-dir /tmp";
    d  = "sudo codium /etc/nixos/modules/desktop.nix    --no-sandbox --user-data-dir /tmp";
    n  = "sudo codium /etc/nixos/modules/networking.nix --no-sandbox --user-data-dir /tmp";
    pk = "sudo codium /etc/nixos/modules/packages.nix   --no-sandbox --user-data-dir /tmp";
    h  = "sudo codium /etc/nixos/modules/home.nix       --no-sandbox --user-data-dir /tmp";
    r  = "sudo nixos-rebuild switch";
  };
}
