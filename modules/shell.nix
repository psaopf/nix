{ config, pkgs, ... }:
{
  ### SHELL ###

  programs.bash.shellAliases = {
    e  = "sudo code /etc/nixos/configuration.nix     --no-sandbox --user-data-dir /tmp";
    b  = "sudo code /etc/nixos/modules/boot.nix       --no-sandbox --user-data-dir /tmp";
    g  = "sudo code /etc/nixos/modules/gpu.nix        --no-sandbox --user-data-dir /tmp";
    d  = "sudo code /etc/nixos/modules/desktop.nix    --no-sandbox --user-data-dir /tmp";
    n  = "sudo code /etc/nixos/modules/networking.nix --no-sandbox --user-data-dir /tmp";
    pk = "sudo code /etc/nixos/modules/packages.nix   --no-sandbox --user-data-dir /tmp";
    h  = "sudo code /etc/nixos/modules/home.nix       --no-sandbox --user-data-dir /tmp";
    r  = "sudo nixos-rebuild switch";
  };
}
