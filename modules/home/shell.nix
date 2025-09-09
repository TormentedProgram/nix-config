{ pkgs, ... }:
{
  home.packages = with pkgs; [];

  programs = {
    # on macOS, you probably don't need this
    bash = {
      enable = true;
      initExtra = ''
        fastfetch
        alias ls="eza -1 -lh --icons --group-directories-first --no-permissions --no-user --time-style '+%_d %b %I:%M %p' --sort=modified --hyperlink -T -L=2"
        alias grep="rg --hyperlink-format file"
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
    fastfetch = {
      enable = true;
      settings =
        {
          logo = {
            source = "nixos";
            padding = {
              right = 4;
            };
          };
          display = {
            size = {
              binaryPrefix = "si";
            };
            color = "blue";
            separator = "  ";
          };
          modules = [
            {
              type = "custom";
              format = "{#1}[{#}Time]";
            }
            {
              type = "datetime";
              key = "󰅐 Date";
              format = "{1}-{3}-{11}";
            }
            {
              type = "uptime";
              key = "󰅐 Uptime";
            }
            "break"
            {
              type = "custom";
              format = "{#1}[{#}Packages]";
            }
            {
              type = "packages";
              key = "󰏖 Packages";
              format = "{all}";
            }
            "break"
            {
              type = "custom";
              format = "{#1}[{#}Desktop Environment]";
            }
            {
              type = "de";
              key = "󰧨 DE";
            }
            {
              type = "wm";
              key = "󱂬 WM";
            }
            {
              type = "wmtheme";
              key = "󰉼 Theme";
            }
            {
              type = "display";
              key = "󰹑 Resolution";
            }
            {
              type = "shell";
              key = "󰞷 Shell";
            }
            {
              type = "terminalfont";
              key = "󰛖 Font";
            }
            "player"
            "media"
            "break"
            {
              type = "custom";
              format = "{#1}[{#}Hardware]";
            }
            {
              type = "cpu";
              key = "󰻠 CPU";
            }
            {
              type = "gpu";
              key = "󰢮 GPU";
            }
            {
              type = "memory";
              key = "󰍛 Memory";
            }
          ];
        };
    };

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
