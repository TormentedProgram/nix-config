{ config, pkgs, ... }:
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = config.myusers
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  boot.kernelParams = [
    "kvm.enable_virt_at_load=0"
  ];
}
