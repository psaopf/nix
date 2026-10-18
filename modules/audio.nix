{ config, pkgs, ... }:
{
  ### AUDIO (Pipewire) ###

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;

    wireplumber.extraConfig."10-bluez" = {
      "monitor.bluez.properties" = {
        "bluez5.codecs" = [ "ldac" "aptx_hd" "aptx" "aac" "sbc_xq" "sbc" ];
        "bluez5.a2dp.ldac.quality" = "auto"; # or "hq" / "sq" / "mq"
      };
    };
  };
}