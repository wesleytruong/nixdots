{ config, pkgs, inputs, ... }:

{
  programs._1password = { enable = true; };
  environment.systemPackages = [
    pkgs.wezterm
    pkgs.neovim
  ];
}
