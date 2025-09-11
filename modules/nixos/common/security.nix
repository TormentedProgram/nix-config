{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    polkit_gnome
  ];

  security.sudo = 
  let
    inherit (lib) mkForce mkDefault getExe';
  in {
    enable = true;
    extraConfig = ''
      Defaults lecture = never
      Defaults pwfeedback
    '';

    extraRules = [
      {
        groups = [ "wheel" ];

        commands = [
          # allow reboot and shutdown without password
          {
            command = getExe' pkgs.systemd "reboot";
            options = [ "NOPASSWD" ];
          }
          {
            command = getExe' pkgs.systemd "shutdown";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };
}
