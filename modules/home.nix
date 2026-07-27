{ config, pkgs, ... }:
{
  home-manager.users.p = { pkgs, ... }: {
    home.stateVersion = "26.05";

    # Example: manage git config
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Your Name";
        email = "you@example.com";
      };

    };
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };          
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin
      "gighmmpiobklfepjocnamgkkbiglidom" # adblock
      "mgngbgbhliflggkamjnpdmegbkidiapm" # Remove youtube shorts
      "gebbhagfogifgggkldgodflihgfeippi" #return youtube dislike
      # add more by their Web Store ID
    ];
  };  

  dconf.settings = {
    "org/cinnamon/muffin" = {
      edge-tiling = true; # still worth keeping — enables left/right half-tiling
    };
    "org/cinnamon/desktop/wm/preferences" = {
      tile-maximize = true; # this is the one that fixes your top-edge behavior
    };
    "org/cinnamon/desktop/interface" = {
      clock-use-24h = false;
    };    
  };

  ### SHORTCUTS ###
  dconf.settings = {
    "org/cinnamon/desktop/keybindings" = {
      custom-list = [ "custom0" "custom1"];
    };
    "org/cinnamon/desktop/keybindings/custom-keybindings/custom0" = {
      name = "Open Terminal";
      command = "ghostty";
      binding = [ "<Control><Shift>p" ];
    };
    "org/cinnamon/desktop/keybindings/custom-keybindings/custom1" = {
      name = "Screen Shot";
      command = "flameshot gui";
      binding = [ "<Super><Shift>s" ];
    };    
  };
};


}
