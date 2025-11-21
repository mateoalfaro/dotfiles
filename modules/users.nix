{ config, pkgs, unstable, ... }:

{
  users.users.jafed = {
    isNormalUser = true;
    description = "jafed";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.getty.autologinUser = "jafed";
}
