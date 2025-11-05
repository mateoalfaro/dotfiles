{ ignis, config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jafed";
  home.homeDirectory = "/home/jafed";

  # Packages that should be installed to the user profiles
  home.packages = with pkgs; [
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.caelestia = {
  enable = true;
  systemd = {
    enable = true; # if you prefer starting from your compositor
    target = "graphical-session.target";
    environment = [];
  };
  settings = {
    general.idle.timeouts = [
                {
                    timeout = 600;
                    idleAction = "lock";
                }
                {
                    timeout = 3000;
                    idleAction = "dpms off";
                    returnAction = "dpms on";
                }
                {
                    timeout = 6000;
                    idleAction = ["systemctl" "suspend-then-hibernate"];
                }
            ];
    bar = {
      status = {
        showAudio = true;
        showBattery = false;
      };
    };
    paths.wallpaperDir = "~/.walls";
  };
  cli = {
    enable = true; # Also add caelestia-cli to path
    settings = {
      theme.enableGtk = false;
    };
  };
};

}
