{ config, pkgs, inputs, unstable, ... }:

{
  
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
};

  # screensharing is borked by default??
   xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  # this shit takes hours to compile
  nixpkgs.config.permittedInsecurePackages = [
                "qtwebengine-5.15.19"
              ];

  programs.gpu-screen-recorder.enable = true; #For promptless recording on both CLI and GUI
  
  environment.systemPackages = with pkgs; [
  file-roller
  gpu-screen-recorder
  unstable.app2unit
  adw-gtk3
  papirus-icon-theme
  libsForQt5.qt5ct
  kdePackages.qt6ct
  foot
  fish
  fastfetch
  wl-clipboard
  wireplumber
  eza
  jq
  starship
  hyprpicker
  gnome-text-editor
  pavucontrol
  nautilus
  nwg-look
  gnome-disk-utility
  hyprpaper
  kitty
];

}
