{ config, lib, profile, inputs, pkgs, ... }:
let cfg = config.jfg.home; in 
{
  options.jfg.home = with lib.types; {
    username = lib.mkOption {
      type = str;
    };
    homeDirectory = lib.mkOption {
      default = "/home/${cfg.username}";
      type = str;
    };
    flakeDirectory = lib.mkOption {
      default = "/home/${cfg.username}/dotfiles";
      type = str;
    };
  };
  config = {
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true; 
    fonts.fontconfig.enable = true;
    home = {
      username = cfg.username;
      homeDirectory = cfg.homeDirectory;
      shellAliases = {
        home-switch = "home-manager switch --flake path:${cfg.flakeDirectory}#${profile}";
        emacs = "COLORTERM=truecolor emacs -nw";
        ga = "git add";
        gs = "git status";
        gb = "git branch";
        gm = "git merge";
        gpl = "git pull";
        gplo = "git pull origin";
        gps = "git push";
        gpso = "git push origin";
        gc = "git commit";
        gcm = "git commit -m";
        gch = "git checkout";
        gchb = "git checkout -b";
        gcoe = "git config user.email";
        gcon = "git config user.name";
        ls = "exa --group-directories-first";
        cat = "bat -p";
        cpr = "rsync -ah --info=progress2";
      };

      packages = with pkgs; [
      ] ++ (import ../shared/packages.nix pkgs inputs);
    };

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";
  };
}