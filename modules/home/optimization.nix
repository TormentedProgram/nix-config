{ ... } @ attrs:
let
  nixos = attrs ? nixosConfig;
  frequency = if nixos then "dates" else "frequency";
in {
  nix.gc = {
    automatic = true;
    ${frequency} = "weekly";
    options = "--delete-older-than 30d";
  };
}
