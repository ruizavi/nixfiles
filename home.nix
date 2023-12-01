{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.anyrun.homeManagerModules.default
    ./home/hypr
    ./home/waybar
    ./home/anyrun.nix
  ];

  home.username = "avi";
  home.homeDirectory = "/home/avi";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    vscode
    neofetch
    kitty
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
