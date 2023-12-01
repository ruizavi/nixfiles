{pkgs, ...}: 

{
  fonts = {
    packages = with pkgs; [
      material-icons
      material-design-icons
      roboto
      iosevka-bin
      (nerdfonts.override {fonts = [ "Iosevka" "JetBrainsMono" ];})
    ];
  };
}