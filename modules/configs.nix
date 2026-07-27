{ config, pkgs, ... }:

{
 ### CONFIG SETTINGS ###
 environment.variables = {};
 
 programs.bash.shellAliases = {
    e = "sudo code /etc/nixos/configuration.nix  --no-sandbox --user-data-dir /tmp";
    p = "sudo code /etc/nixos/modules/programs.nix  --no-sandbox --user-data-dir /tmp";
    c = "sudo code /etc/nixos/modules/configs.nix  --no-sandbox --user-data-dir /tmp";
    s = "sudo code /etc/nixos/modules/system.nix  --no-sandbox --user-data-dir /tmp";
    h = "sudo code /etc/nixos/modules/home.nix  --no-sandbox --user-data-dir /tmp";    
    r = "sudo nixos-rebuild switch";
  };

}

