{ pkgs, ... }:
{
  home.packages = with pkgs; [];

  programs = {
    # on macOS, you probably don't need this
    bash = {
      enable = true;
      initExtra = ''
        fastfetch
      '';
    };

    # For macOS's default shell.
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      envExtra = ''
        
      '';
      profileExtra = ''
        # Custom ~/.zprofile goes here
      '';
      loginExtra = ''
        # Custom ~/.zlogin goes here
      '';
      logoutExtra = ''
        # Custom ~/.zlogout goes here
      '';
    };

    # Required linux user tool
    fastfetch.enable = true;

    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Better `cat`
    bat.enable = true;

    # Better `ls`
    eza.enable = true;

    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;

    # Better `grep`
    ripgrep.enable = true;

    # Better shell prompt!
    starship = {
      enable = true;
      settings = {
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
      };
    };
  };
}
