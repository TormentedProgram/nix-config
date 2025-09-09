{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
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
}
